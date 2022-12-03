using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day2.jl"))

println("Starting tests")
t2 = time()
@testset "Day 2" begin
    @testset "Test" begin
        tp = testpath(2)
        @test d2_1sol(tp) == 15
        @test d2_2sol(tp) == 12
    end

    @testset "Full" begin
        fp = fullpath(2)
        @test d2_1sol(fp) == 9651
        @test d2_2sol(fp) == 10560
    end
end
t2 = time() - t2
println("\nTest took total time of:")
println(round(t2/60, digits = 3), " minutes")
