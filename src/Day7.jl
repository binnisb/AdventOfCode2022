include("BaseImports.jl")
using Pipe
using Graphs, MetaGraphs

abstract type Parser end

abstract type Command <: Parser end
struct ls <: Command end
struct cd <: Command 
    dir::String
end
abstract type Result <: Parser end
struct dir <: Result 
    path::String
end
struct file <: Parser 
    fs::Int
    name::String
    file(line) = begin
        s,f = split(line)
        new(parse(Int,s), f)
    end
end

parseline(line) = begin
    startswith(line, raw"$ cd") && return cd(line[6:end])
    startswith(line, raw"$ ls") && return ls()
    startswith(line, "dir") && return dir(line[5:end])
    return file(line)
end



d7(fp) = begin
    pl=@pipe fp |> readlines .|> parseline
    mg = MetaDiGraph()
    set_indexing_prop!(mg, :path)
    add_vertex!(mg, :path, "/")
    currentvertex = mg["/", :path]
    set_props!(mg, currentvertex, Dict(:total=>0))
    for (i, line) in enumerate(pl)
        if (typeof(line) == cd) && (line.dir == "..")
            currentvertex == mg["/",:path] && continue
            currentvertex = inneighbors(mg, currentvertex)[1]
        elseif (typeof(line) == cd) && (line.dir == "/")
            currentvertex = mg["/",:path]
        elseif typeof(line) == cd
            if line.dir ∈ keys(mg[:path])
                currentvertex = mg[line.dir, :path]
                continue
            end
            add_vertex!(mg, :path, line.dir)
            previousvertex, currentvertex = currentvertex, mg[line.dir, :path]
            add_edge!(mg,previousvertex=>currentvertex)
            set_props!(mg, currentvertex, Dict(:total=>0))
        elseif typeof(line) ∈ (dir,ls)
            continue
        else
            set_prop!(mg, currentvertex, :total, line.fs+get_prop(mg, currentvertex, :total))
        end
    end
    mg
end

sumgraph(mg, v, sums=Dict{Int,Int}()) = begin
    currenttotal = get_prop(mg, v, :total)
    if outdegree(mg, v) == 0
        sums[v] = currenttotal
        return (sums, sums[v])
    end
    vsum = 0
    for n in outneighbors(mg, v)
        sums, s = sumgraph(mg, n, sums)
        vsum += s
    end
    sums[v] = vsum + currenttotal
    return (sums, sums[v])
end


d7_1sol(p) = @pipe d7(p) |> sumgraph(_,_["/", :path])[1] |> filter(<=(100000),values(_)|>collect) |> sum

p=fullpath(7)
#p=testpath(7)
res = d7_1sol(p)
res