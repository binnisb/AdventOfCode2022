include("BaseImports.jl")
using Pipe

splitcratesinstructions(fp) = @pipe fp |> read(_, String) |> split(_, r"\r\n\r\n|\n\n") |> split.(_, r"\r\n|\n")
processcratesandinstructions(candi) = (processcrates(candi[1]), processinstructions(candi[2]))

processcrates(lines) = @pipe lines |> reverse |> createstacks
createstacks(lines) = begin 
    stacksnr = parse(Int,first(lines)[end-1])
    stacks = [Vector{Char}() for _ in 1:stacksnr]
    for line in lines[2:end]
        for i in 1:stacksnr
            start = (i-1)*4 + 2
            box = line[start]
            box == ' ' && continue
            push!(stacks[i], box)
        end
    end
    stacks
end

struct Instructions
    move::Int
    from::Int
    to::Int
    Instructions(line) = @pipe eachmatch.(r"\d+", line) |> collect .|> parse(Int,_.match) |> new(_...)
end
processinstructions(lines) = Instructions.(lines)

move1(instruction::Instructions, crates) = append!(
    crates[instruction.to],
    [pop!(crates[instruction.from]) for _ in 1:instruction.move ]
)

process1(crates, instructions) = begin
    for instruction in instructions
        move1(instruction, crates)
    end
    crates
end 

move2(instruction::Instructions, crates) = append!(
    crates[instruction.to],
    reverse([pop!(crates[instruction.from]) for _ in 1:instruction.move])
)
    

process2(crates, instructions) = begin
    for instruction in instructions
        move2(instruction, crates)
    end
    crates
end 

d5_1sol(fp) = @pipe fp |>
    splitcratesinstructions |>
    processcratesandinstructions |>
    process1(_...) |>
    join(pop!(c) for c in _)

d5_2sol(fp) = @pipe fp |>
    splitcratesinstructions |>
    processcratesandinstructions |>
    process2(_...) |>
    join(pop!(c) for c in _)