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



d7_1sol(fp) = begin
    pl=@pipe fp |> readlines .|> parseline
    mg = MetaDiGraph()
    set_indexing_prop!(mg, :path)
    add_vertex!(mg, :path, "ROOT")
    currentvertex = mg["ROOT", :path]
    set_props!(mg, currentvertex, Dict(:previous=>nothing, :total=>0, :distance=>0))
    for line in pl
        if (typeof(line) == cd) && (line.dir == "..")
            currentvertex = inneighbors(mg, currentvertex)[1]
        elseif typeof(line) == cd
            add_vertex!(mg, :path, line.dir)
            previousvertex, currentvertex = currentvertex, mg[line.dir, :path]
            add_edge!(mg,previousvertex=>currentvertex)
            set_props!(mg, currentvertex, Dict(:previous=>previousvertex,:total=>0, :distance=>mg[previousvertex, :distance]+1))
        elseif typeof(line) ∈ (dir,ls)
            continue
        else
            add_vertex!(mg, :path, line.name)
            add_edge!(mg, currentvertex=>mg[line.name, :path])
            set_props!(mg, mg[line.name, :path], Dict(:fs=>line.fs, :leaf=>true, :previous=>currentvertex, :distance=>mg[currentvertex, :distance]+1))
        end
    end
    mg
end
processgraph(g, node, total=0) = begin
    if g[]
end

tp = testpath(7)
mg = d7_1sol(tp)