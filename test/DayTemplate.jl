using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("Day{PROBLEM}.jl"))

println("Starting tests")
ti = time()
@testset "Day {PROBLEM} Test" begin
    @test d{PROBLEM}_1solve(day{PROBLEM}TestPath) == 7
    @test d{PROBLEM}_2solve(day{PROBLEM}TestPath) == 5
end

@testset "Day {PROBLEM} Full" begin
    @test d{PROBLEM}_1solve(day{PROBLEM}FullPath) == 7
    @test d{PROBLEM}_2solve(day{PROBLEM}FullPath) == 5
end
ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
