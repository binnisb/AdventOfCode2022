using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("Day1.jl"))

println("Starting tests")
ti = time()
@testset "Day 1" begin
    @testset "Test" begin
        @test d1_sol(day1TestPath,1) == 24000
        @test d1_sol(day1TestPath,3) == 45000
    end

    @testset "Full" begin
        @test d1_sol(day1FullPath,1) == 66487
        @test d1_sol(day1FullPath,3) == 197301
    end
end
ti = time() - ti
println("\nTest took total time of:")
println(round(ti/60, digits = 3), " minutes")
