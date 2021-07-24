# julia> include("/Users/ian/jd/10-19 Code/12 Julia/12.03 PE/pe2.jl")

fibs = [1,2]

while (fibs[end-1] + fibs[end]) < 4*10^6
    push!(fibs, fibs[end-1] + fibs[end])
end

println("ans = $(sum([i for i in fibs if i%2==0]))")
