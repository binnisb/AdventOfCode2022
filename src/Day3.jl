include("BaseImports.jl")
using Pipe

chartoind = Dict( ['a':'z'; 'A':'Z'] |> enumerate .|>reverse)

d3_1sol(fp::Path) = @pipe readlines(fp.filePath) .|> 
    intersect(Set(_[1:Int(length(_)/2)]), Set(_[Int(length(_)/2)+1:end])) .|>
    chartoind[pop!(_)] |>
    sum

d3_2sol(fp::Path) = @pipe readlines(fp.filePath) |> 
    Iterators.partition(_,3) |>
    collect |>
    map(l->Set.(l),_) |>
    map(c->intersect(c...),_) |>
    pop!.(_) |>
    map(x->chartoind[x],_) |>
    sum