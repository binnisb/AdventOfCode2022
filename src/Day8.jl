include("BaseImports.jl")
using Pipe

d8(p) = @pipe readlines(p) .|> split(_,"") .|> parse.(Int,_) |> reduce(hcat,_)' 

d8_1sol(p) = begin 
    m = d8(p)
    rows,cols = size(m)
    res = zeros(Int, rows,cols)
    for i in 1:4
        for r in 1:rows
            maxcol=-1
            for c in 1:cols
                if m[r,c] > maxcol
                    res[r,c] = 1
                    maxcol=m[r,c]
                end
            end
        end
        res = rotr90(res)
        m = rotr90(m)
        cols,rows = rows,cols
    end
    res |> sum
end

d8_2sol(p) = begin
    m = d8(p)
    rows,cols=size(m)
    maxscenic = 0
    for r in 2:(rows-1)
        for c in 2:(cols-1)
            small = m .< m[r,c]
            localscenic = 1
            localsum = 1
            for i in (r+1):(rows-1)
                small[i,c] == 1 ? localsum+=1 : break
            end
            localscenic*=localsum
            localsum = 1
            for i in (r-1):-1:2
                small[i,c] == 1 ? localsum+=1 : break
            end
            localscenic*=localsum
            localsum = 1
            for i in (c+1):(cols-1)
                small[r,i] == 1 ? localsum+=1 : break
            end
            localscenic*=localsum
            localsum = 1
            for i in (c+-1):-1:2
                small[r,i] == 1 ? localsum+=1 : break
            end
            localscenic*=localsum
            maxscenic = max(maxscenic,localscenic)
        end
    end
    maxscenic
end

tp = testpath(8)
d8_2sol(tp)