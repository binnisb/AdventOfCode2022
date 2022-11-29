using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("Day1.jl"))

println("Starting tests")
ti = time()
@testset "Day 1" begin
    @testset "Test" begin
        @test d1_1solve(day1TestPath) == 7
        @test d1_2solve(day1TestPath) == 5
    end

    @testset "Full" begin
        @test d1_1solve(day1FullPath) == 1581
        @test d1_2solve(day1FullPath) == 1618
    end
end
ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
