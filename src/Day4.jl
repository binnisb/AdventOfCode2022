include("BaseImports.jl")
using Pipe

d4(fp) = @pipe fp |> 
    readlines .|> 
    split(_,',') .|> 
    map(x->split(x,'-'),_) .|> 
    map(x->parse.(Int,x),_) .|>
    sort 

compareincluded(f, s) = f[1] == s[1] || (f[1] <= s[1] && f[2] >= s[2])
d4_1sol(fp) = @pipe fp |> 
    d4 .|>
    compareincluded(_...) |>
    sum


compareintersect(f,s) = f[2] >= s[1]
d4_2sol(fp) = @pipe fp |>
    d4 .|>
    compareintersect(_...) |>
    sum


fp = testpath(4)
d4_2sol(fp)