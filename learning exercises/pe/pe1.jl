# julia> include("/Users/ian/jd/10-19 Code/12 Julia/12.03 PE/pe1.jl")

println("ans = $(sum([i for i=1:999 if (i%3 == 0) || (i%5 == 0)]))")
