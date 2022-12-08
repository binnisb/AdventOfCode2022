using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day8.jl"))

println("Starting tests")
t8 = time()
@testset "Day 8" begin
    @testset "Test" begin
        tp = testpath(8)
        
        @test d8_1sol(tp) == 21
        @test d8_2sol(tp) == 21
    end

    @testset "Full" begin
        fp = fullpath(8)
        @test d8_1sol(fp) == 1690
    end
end
t8 = time() - t8
println("\nTest took total time of:")
println(round(t8/60, digits = 3), " minutes")
