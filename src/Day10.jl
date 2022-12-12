include("BaseImports.jl")
using Pipe

processline(line) = occursin("noop",line) ? 0 : [0,parse(Int,split(line)[2])]
d10(p) = @pipe p |> readlines .|> processline |> Iterators.flatten |> collect |> pushfirst!(_,1)


d10_1sol(p) = begin
    l = d10(p)
    s = cumsum(l)
    @pipe 20:40:220 .|>  s[_]*_ |> sum
end

d10_2sol(p) = begin
    l = d10(p)
    @pipe [i ∈ (v-1):(v+1) ? "#" : "." for (i,v) in enumerate(l)] |> reshape(_[2:end],:,40)
end

p = testpath(10)
res=@pipe d10_2sol(p)