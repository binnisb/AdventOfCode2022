using DrWatson
@quickactivate "AdventOfCode2022"

testpath(problem) = "$(datadir("puzzle","test"))/$(problem).txt"
fullpath(problem) = "$(datadir("puzzle","full"))/$(problem).txt"