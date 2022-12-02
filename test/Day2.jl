using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day2.jl"))

println("Starting tests")
t2 = time()
@testset "Day 2" begin
    @testset "Logic" begin
        @test shapescore(A) == 1
        @test shapescore(X) == 1
        @test shapescore(B) == 2
        @test shapescore(Y) == 2
        @test shapescore(C) == 3
        @test shapescore(Z) == 3

        @test matchscore(A,X) == 3
        @test matchscore(B,Y) == 3
        @test matchscore(C,Z) == 3
        @test matchscore(A,Y) == 6
        @test matchscore(B,Z) == 6
        @test matchscore(C,X) == 6
        @test matchscore(A,Z) == 0
        @test matchscore(B,X) == 0
        @test matchscore(C,Y) == 0
        
        @test matchoutcome(A,X) == 3
        @test matchoutcome(B,Y) == 5
        @test matchoutcome(C,Z) == 7
        @test matchoutcome(A,Y) == 4
        @test matchoutcome(B,Z) == 9
        @test matchoutcome(C,X) == 2
        @test matchoutcome(A,Z) == 8
        @test matchoutcome(B,X) == 1
        @test matchoutcome(C,Y) == 6
        
    end
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
