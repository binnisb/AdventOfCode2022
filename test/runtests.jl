using DrWatson, Test
@quickactivate "AdventOfCode2022"

println("Starting tests")
ttop = time()
include("Day1.jl")
include("Day2.jl")
ttop = time() - ttop
println("\nTest took total time of:")
println(round(ttop/60, digits = 3), " minutes")