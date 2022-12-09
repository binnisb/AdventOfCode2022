using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day7.jl"))

println("Starting tests")
t7 = time()
@testset "Day 7" begin
    @testset "Test" begin
        tp = testpath(7)
        
        @test d7_1sol(tp) == 95437
    end

    @testset "Full" begin
        fp = fullpath(7)
        @test d7_1sol(fp) == 1912
        # @test d6_2sol(read(fp,String)) == 2122
    end
end
t7 = time() - t7
println("\nTest took total time of:")
println(round(t7/60, digits = 3), " minutes")
