include("BaseImports.jl")
using Pipe
score(::Val{'X'}) = 1
score(::Val{'Y'}) = 2
score(::Val{'Z'}) = 3

result(::Val{'A'}, ::Val{'X'}) = 3
result(::Val{'B'}, ::Val{'Y'}) = 3
result(::Val{'C'}, ::Val{'Z'}) = 3

result(::Val{'A'}, ::Val{'Z'}) = 0
result(::Val{'B'}, ::Val{'X'}) = 0
result(::Val{'C'}, ::Val{'Y'}) = 0

result(f,s) = 6

matchresult(m) = score(Val(last(m))) + result(Val(first(m)), Val(last(m)))

d2(fp)  = @pipe read(fp, String) |> 
    split(_,r"(\r\n|\n)") 

d2_1sol(fp) = @pipe fp |>
    d2 |>
    matchresult.(_) |>
    sum

score(::Val{'A'}) = 1
score(::Val{'B'}) = 2
score(::Val{'C'}) = 3

matchresult(::Val{T}, ::Val{'X'}) where T = 0 + mod(score(Val(T)) - 1 - 1, 3) + 1
matchresult(::Val{T}, ::Val{'Y'}) where T = 3 + score(Val(T))
matchresult(::Val{T}, ::Val{'Z'}) where T = 6 +  mod(score(Val(T)), 3) + 1

d2_2sol(fp) = @pipe fp |>
    d2 .|>
    matchresult(Val(first(_)), Val(last(_))) |>
    sum

