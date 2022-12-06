include("BaseImports.jl")
using Pipe

unique(str, start, n) = (@view str[start:start+n-1]) |> Set |> length |> ==(n) ? start+n-1 : unique(str,start+1,n)

d6_1sol(data) = unique(data, 1, 4)
d6_2sol(data) = unique(data, 1, 14)