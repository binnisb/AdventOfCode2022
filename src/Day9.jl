include("BaseImports.jl")
using Pipe

d9(p) = @pipe p |> readlines .|> split .|> (_[1],parse(Int,_[2]))

parse9(side, steps, head, tail, tailplaces=Set{CartesianIndex}()) = begin
    steps == 0 && return (head, tail, tailplaces)

    if side == "R"
        head = head + CartesianIndex((1,0))
        diffcart = head - tail
        if (diffcart.I .|> abs |> maximum) > 1
            tail = tail + CartesianIndex((1,sign(diffcart[2])))
        end
    elseif side == "L"
        head = head + CartesianIndex((-1,0))
        diffcart = head - tail
        if (diffcart.I .|> abs |> maximum) > 1
            tail = tail + CartesianIndex((-1,sign(diffcart[2])))
        end
    elseif side == "U"
        head = head + CartesianIndex((0,1))
        diffcart = head - tail
        if (diffcart.I .|> abs |> maximum) > 1
            tail = tail + CartesianIndex((sign(diffcart[1]),1))
        end
    elseif side == "D"
        head = head + CartesianIndex((0,-1))
        diffcart = head - tail
        if (diffcart.I .|> abs |> maximum) > 1
            tail = tail + CartesianIndex((sign(diffcart[1]),-1))
        end
    end
    push!(tailplaces, tail)
    return parse9(side, steps-1, head, tail, tailplaces)
end

parse9(instructions) = begin
    head = CartesianIndex((0,0))
    tail = CartesianIndex((0,0))
    tailspace = Set{CartesianIndex}([tail])
    
    for instruction in instructions
        (head,tail,tailspace) = parse9(instruction...,head,tail,tailspace)
    end
    tailspace
end


d9_1sol(p) = @pipe p |> d9 |> parse9 |> length

