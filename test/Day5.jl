using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day5.jl"))

println("Starting tests")
t5 = time()
@testset "Day 5" begin
    @testset "Test" begin
        tp = testpath(5)
        @test d5_1sol(tp) == "CMZ"
        #@test d5_2sol(tp) == 4
    end

    @testset "Full" begin
        fp = fullpath(5)
        @test d5_1sol(fp) == "RNZLFZSJH"
        #@test d5_2sol(fp) == 854
    end
end
t5 = time() - t5
println("\nTest took total time of:")
println(round(t5/60, digits = 3), " minutes")
