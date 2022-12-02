include("BaseImports.jl")
using Pipe

abstract type Hand end

abstract type Rock <: Hand end
abstract type Paper <: Hand end
abstract type Scissor <: Hand end

abstract type A <: Rock end
abstract type B <: Paper end
abstract type C <: Scissor end

abstract type X <: Rock end
abstract type Y <: Paper end
abstract type Z <: Scissor end

shapescore(::Type{T}) where T <: Rock = 1 
shapescore(::Type{T}) where T <: Paper = 2
shapescore(::Type{T}) where T <: Scissor = 3


matchscore(::Type{T}, ::Type{U}) where T <: Rock where U <: Rock = 3
matchscore(::Type{T}, ::Type{U}) where T <: Paper where U <: Paper = 3
matchscore(::Type{T}, ::Type{U}) where T <: Scissor where U <: Scissor = 3


matchscore(::Type{T}, ::Type{U}) where T <: Rock where U <: Paper = 6
matchscore(::Type{T}, ::Type{U}) where T <: Paper where U <: Scissor = 6
matchscore(::Type{T}, ::Type{U}) where T <: Scissor where U <: Rock = 6

matchscore(their, my) = 0

mapper = Dict{String,DataType}(string(t) => t for t in (A,B,C,X,Y,Z))


d2(fp::Path) = @pipe read(fp.filePath, String) |> 
    split(_,"\n") |> 
    split.(_) |> 
    map.(h->get(mapper,h,nothing),_) 

d2_1sol(fp::Path) = @pipe fp |> 
    d2 |> 
    map(l -> matchscore(l...) + shapescore(l[end]),_) |> 
    sum

win(::Type{A}) = B
win(::Type{B}) = C
win(::Type{C}) = A
lose(::Type{A}) = C
lose(::Type{B}) = A
lose(::Type{C}) = B
matchoutcome(::Type{T}, ::Type{X}) where T <: Hand = 0 + shapescore(lose(T))
matchoutcome(::Type{T}, ::Type{Y}) where T <: Hand = 3 + shapescore(T)
matchoutcome(::Type{T}, ::Type{Z}) where T <: Hand = 6 + shapescore(win(T))

d2_2sol(fp::Path) = @pipe fp |> 
    d2 |>
    map(l -> matchoutcome(l...),_) |> 
    sum
