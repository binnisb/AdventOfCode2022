using DrWatson
@quickactivate "AdventOfCode2022"

using AOC
p_test = datadir("puzzle","test")
p_full = datadir("puzzle","full")

day1TestPath = Path("$(p_test)/1.txt")
day1FullPath = Path("$(p_full)/1.txt")

d1dFunc(data) = begin
    insert!(data, 1, "")
    elves_cals = Dict{Int, Int}()
    elf = 0
    for line in data
        if isempty(line)
            elf += 1
            elves_cals[elf] = 0
            continue
        end
        elves_cals[elf] += parse(Int, line)
    end
    elves_cals
end
d1_1sFunc(data) = begin
    max_elf = 0
    max_cal = 0
    for (elf,cals) in data
        if cals > max_cal
            max_elf = elf
            max_cal = cals
        end
    end
    max_cal,max_elf
end
d1_2sFunc(data) = begin
    total_cals = 0
    for i in 1:3
        cals, elf = d1_1sFunc(data)
        total_cals += cals
        delete!(data, elf)
    end
    total_cals
end
d1_1solve(path) = solve(path; dFunc=d1dFunc, sFunc=d1_1sFunc)[1]
d1_2solve(path) = solve(path; dFunc=d1dFunc, sFunc=d1_2sFunc)