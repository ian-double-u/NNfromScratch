# julia> include("/Users/ian/jd/10-19 Code/12 Julia/12.03 PE/pe4.jl")

function ispal(x::Int64)
    if sum(abs.([parse(Int64,i) for i=string(x)].-reverse([parse(Int64,i) for i=string(x)]))) == 0
        return true
    else
        return false
    end
end

pals = [k for k=[i*j for i=1:999 for j=1:i] if ispal(k)]
println("ans = $(sort(pals)[end])")
