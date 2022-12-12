using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day10.jl"))

println("Starting tests")
t10 = time()
@testset "Day 10" begin
    @testset "Test" begin
        tp = testpath(10)
        
        @test d10_1sol(tp) == 13140

        #@test d10_2sol(tp) == "##..##..##..##..##..##..##..##..##..##..###...###...###...###...###...###...###.####....####....####....####....####....#####.....#####.....#####.....#####.....######......######......######......###########.......#######.......#######....."
    end

    @testset "Full" begin
        fp = fullpath(10)
        @test d10_1sol(fp) == 14520
    end
end
t10 = time() - t10
println("\nTest took total time of:")
println(round(t10/60, digits = 3), " minutes")
