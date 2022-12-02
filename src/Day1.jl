using DrWatson
@quickactivate "AdventOfCode2022"

using Pipe
p_test = datadir("puzzle","test")
p_full = datadir("puzzle","full")

day1TestPath = Path("$(p_test)/1.txt")
day1FullPath = Path("$(p_full)/1.txt")
 
d1(fp::Path) = @pipe fp.filePath |> 
    read(_, String) |> 
    split(_, "\n\n") |> 
    split.(_,"\n") |> 
    map.(p->parse.(Int,p),_) |> 
    sum.(_) |> 
    sort(_; rev=true)

d1_sol(fp::Path, nr) = @pipe fp |> d1 |> Iterators.take(_,nr) |> sum
