using DrWatson
@quickactivate "AdventOfCode2022"

testpath(problem) = datadir("puzzle","test","$(problem).txt")
fullpath(problem) = datadir("puzzle","full","$(problem).txt")

testpath(problem,part) = datadir("puzzle","test","$(problem).$(part).txt")
fullpath(problem,part) = datadir("puzzle","full","$(problem).$(part).txt")