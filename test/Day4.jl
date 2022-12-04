using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day4.jl"))

println("Starting tests")
t4 = time()
@testset "Day 4" begin
    @testset "Test" begin
        tp = testpath(4)
        @test d4_1sol(tp) == 2
        @test d4_2sol(tp) == 4
    end

    @testset "Full" begin
        fp = fullpath(4)
        @test d4_1sol(fp) == 532
        @test d4_2sol(fp) == 854
    end
end
t4 = time() - t4
println("\nTest took total time of:")
println(round(t4/60, digits = 3), " minutes")
