using DrWatson
@quickactivate

include(srcdir("BaseImports.jl"))
using Pipe

d1(fp) = @pipe fp |> 
    read(_, String) |> 
    split(_, r"(\n\n|\r\n\r\n)") |> 
    split.(_,r"(\r\n|\n)") |> 
    map.(p->parse.(Int,p),_) |> 
    sum.(_) |> 
    sort(_; rev=true)

d1_sol(fp, nr) = @pipe fp |> d1 |> Iterators.take(_,nr) |> sum
