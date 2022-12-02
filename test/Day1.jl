using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day1.jl"))

println("Starting tests")
t1 = time()
@testset "Day 1" begin
    @testset "Test" begin
        tp = testpath(1)
        @test d1_sol(tp,1) == 24000
        @test d1_sol(tp,3) == 45000
    end

    @testset "Full" begin
        fp = fullpath(1)
        @test d1_sol(fp,1) == 66487
        @test d1_sol(fp,3) == 197301
    end
end
t1 = time() - t1
println("\nTest took total time of:")
println(round(t1/60, digits = 3), " minutes")
