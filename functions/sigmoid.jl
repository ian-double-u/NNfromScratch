#Sigmoid function in Julia
#(presumably) accepts Float & Int arguments
function sigmoid(x)
    return (MathConstants.e^x)/(1 + MathConstants.e^x)
end

#Generates all primes under the limit
#only takes positive integer values, greater than 2
function genprimes(limit)
    list = fill(true, limit)
    primes = []
    for i in 2:isqrt(limit)
        if list[i] == true
            j = i^2
            while j <= limit
                list[j] = false
                j += i
            end
        end
    end
    for i in 2:limit
        if list[i] == true
            push!(primes, i)
        end
    end
    return primes
end
