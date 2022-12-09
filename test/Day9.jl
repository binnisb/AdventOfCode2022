using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day9.jl"))

println("Starting tests")
t9 = time()
@testset "Day 9" begin
    @testset "Test" begin
        tp = testpath(9)
        
        @test d9_1sol(tp) == 13
        @test d9_2sol(tp) == 1
        tp2 = testpath(9,2)
        @test d9_2sol(tp2) = 36
    end

    @testset "Full" begin
        fp = fullpath(9)
        @test d9_1sol(fp) == 6266
        #@test d8_2sol(fp) == 535680
    end
end
t9 = time() - t9
println("\nTest took total time of:")
println(round(t9/60, digits = 3), " minutes")
