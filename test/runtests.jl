using DrWatson, Test
@quickactivate "AdventOfCode2022"

println("Starting tests")
ttop = time()
include("Day1.jl")
include("Day2.jl")
include("Day3.jl")
include("Day4.jl")
include("Day5.jl")
ttop = time() - ttop
println("\nTest took total time of:")
println(round(ttop/60, digits = 3), " minutes")