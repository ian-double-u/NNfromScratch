# julia> include("/Users/ian/jd/10-19 Code/12 Julia/12.03 PE/pe3.jl")

function sieve_e(n)
    ints = 2:n; p = 2; i = 1
    while ints[end] != p
        ints = setdiff(ints,[j*p for j=2:Int(ceil(n/p))])
        p = ints[i + 1]; i += 1
    end
    return ints
end

function gpd(n)
    test = []
    p = sieve_e(Int(ceil(sqrt(n))))
    for i in p
        if n%i==0
            push!(test,i)
        end
    end
    return test[end]
end

println("ans = $(gpd(600851475143))")
