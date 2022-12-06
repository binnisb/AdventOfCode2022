using DrWatson, Test
@quickactivate "AdventOfCode2022"

# Here you include files using `srcdir`
# include(srcdir("file.jl"))
include(srcdir("BaseImports.jl"))
include(srcdir("Day6.jl"))

println("Starting tests")
t6 = time()
@testset "Day 6" begin
    @testset "Test" begin
        tp = testpath(6)
        
        @test d6_1sol("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7
        @test d6_1sol("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5
        @test d6_1sol("nppdvjthqldpwncqszvftbrmjlhg") == 6
        @test d6_1sol("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10
        @test d6_1sol("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11

        @test d6_2sol("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 19
        @test d6_2sol("bvwbjplbgvbhsrlpgdmjqwftvncz") == 23
        @test d6_2sol("nppdvjthqldpwncqszvftbrmjlhg") == 23
        @test d6_2sol("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 29
        @test d6_2sol("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 26
    end

    @testset "Full" begin
        fp = fullpath(6)
        @test d6_1sol(read(fp,String)) == 1912
        @test d6_2sol(read(fp,String)) == 2122
    end
end
t6 = time() - t6
println("\nTest took total time of:")
println(round(t6/60, digits = 3), " minutes")
