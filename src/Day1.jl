include("BaseImports.jl")
using Pipe

d1(fp) = @pipe fp |> 
    read(_, String) |> 
    split(_, "\n\n") |> 
    split.(_,"\n") |> 
    map.(p->parse.(Int,p),_) |> 
    sum.(_) |> 
    sort(_; rev=true)

d1_sol(fp, nr) = @pipe fp |> d1 |> Iterators.take(_,nr) |> sum
