using DrWatson
@quickactivate "AdventOfCode2022"

using AOC
p_test = datadir("puzzle","test")
p_full = datadir("puzzle","full")

day{PROBLEM}TestPath = Path("$(p_test)/{PROBLEM}.txt")
day{PROBLEM}FullPath = Path("$(p_full)/{PROBLEM}.txt")

d{PROBLEM}dFunc(data) = parse.(Int, data) 
#windowincrease(data, window) = [sum(data[i:i+window-1]) for i in 1:(length(data)-window+1)] |> d -> (d[2:end] - d[1:end-1] .> 0) |> sum
d{PROBLEM}_1sFunc(data) = #windowincrease(data, 1)
d{PROBLEM}_2sFunc(data) = #windowincrease(data, 3)
d{PROBLEM}_1solve(path) = solve(path; dFunc=d{PROBLEM}dFunc, sFunc=d{PROBLEM}_1sFunc)
d{PROBLEM}_2solve(path) = solve(path; dFunc=d{PROBLEM}dFunc, sFunc=d{PROBLEM}_2sFunc)

