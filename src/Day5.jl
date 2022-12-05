include("BaseImports.jl")
using Pipe

splitcratesinstructions(fp) = @pipe fp |> read(_, String) |> split(_, r"\r\n\r\n|\n\n") |> split.(_, r"\r\n|\n")
processcratesandinstructions(candi) = (processcrates(candi[1]), processinstructions(candi[2]))

processcrates(lines) = @pipe lines |> reverse |> createstacks
createstacks(lines) = begin 
    stacksnr = parse(Int,first(lines)[end-1])
    stacks = [Vector{String}() for _ in 1:stacksnr]
    for line in lines[2:end]
        line = line * " "
        for i in 1:stacksnr
            start = (i-1)*4 + 2
            box = line[start:start]
            box == " " && continue
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

move(instruction::Instructions, crates) = for _ in 1:instruction.move 
    push!(crates[instruction.to],pop!(crates[instruction.from]))
end

process(crates, instructions) = begin
    for instruction in instructions
        move(instruction, crates)
    end
    crates
end 
    

d5_1sol(fp) = @pipe fp |>
    splitcratesinstructions |>
    processcratesandinstructions |>
    process(_...) |>
    join(pop!(c) for c in _)