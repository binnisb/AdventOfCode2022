using DrWatson
@quickactivate "AdventOfCode2022"

abstract type Input end
struct Path <: Input
    filePath::String
end
struct IOInput <:Input
    data
end

testpath(problem) = Path("$(datadir("puzzle","test"))/$(problem).txt")
fullpath(problem) = Path("$(datadir("puzzle","full"))/$(problem).txt")