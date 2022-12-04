include("BaseImports.jl")
using Pipe

const chars =  ['a':'z'; 'A':'Z'] |> collect |> join

d3_1sol(fp) = @pipe readlines(fp) .|> 
    intersect(_[1:Int(length(_)/2)], _[Int(length(_)/2)+1:end]) .|>
    pop! .|>
    findfirst(_,chars) |>
    sum

d3_2sol(fp) = @pipe readlines(fp) |> 
    Iterators.partition(_,3) |>
    collect |>
    map(c->intersect(c...),_) |>
    pop!.(_) |>
    map(x->findfirst(x,chars),_) |>
    sum