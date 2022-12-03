using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day3.jl"))

println("Starting tests")
t3 = time()
@testset "Day 3" begin
    @testset "Test" begin
        tp = testpath(3)
        @test d3_1sol(tp) == 157
        @test d3_2sol(tp) == 70
    end

    @testset "Full" begin
        fp = fullpath(3)
        @test d3_1sol(fp) == 7553
        @test d3_2sol(fp) == 2758
    end
end
t3 = time() - t3
println("\nTest took total time of:")
println(round(t3/60, digits = 3), " minutes")
