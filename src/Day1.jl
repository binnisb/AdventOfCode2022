using DrWatson
@quickactivate "AdventOfCode2022"

using AOC2022
p_test = datadir("puzzle","test")
p_full = datadir("puzzle","full")

day1TestPath = Path("$(p_test)/1.txt")
day1FullPath = Path("$(p_full)/1.txt")

d1dFunc(data) = parse.(Int, data) 
windowincrease(data, window) = [sum(data[i:i+window-1]) for i in 1:(length(data)-window+1)] |> d -> (d[2:end] - d[1:end-1] .> 0) |> sum
d1_1sFunc(data) = windowincrease(data, 1)
d1_2sFunc(data) = windowincrease(data, 3)
d1_1solve(path) = solve(path; dFunc=d1dFunc, sFunc=d1_1sFunc)
d1_2solve(path) = solve(path; dFunc=d1dFunc, sFunc=d1_2sFunc)