include("BaseImports.jl")
using Pipe

d4(fp) = @pipe fp |> 
    readlines .|> 
    split(_,',') .|> 
    map(x->split(x,'-'),_) .|> 
    map(x->parse.(Int,x),_) .|>
    (first(_[1]):last(_[1]), (first(_[2]):last(_[2])))

compareincluded(f, s) = f ⊆ s || s ⊆ f
d4_1sol(fp) = @pipe fp |> 
    d4 .|>
    compareincluded(_...) |>
    sum


compareintersect(f,s) = !isempty(f ∩ s)
d4_2sol(fp) = @pipe fp |>
    d4 .|>
    compareintersect(_...) |>
    sum

