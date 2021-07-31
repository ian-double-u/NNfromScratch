function sigmoid(x::Float64)::Float64
    return (MathConstants.e^x)/(1 + MathConstants.e^x)
end

function sigmoid_p(x::Float64)::Float64
    return (MathConstants.e^x)/(1 + 2MathConstants.e^x + MathConstants.e^(2x))
end

function MSE(a::Vector{Float64},l::Vector{Float64})::Float64
    return 0.5*(sum((a.-l).^2))
end

function MSE_p(a::Vector{Float64},l::Vector{Float64})::Float64
    return sum(a.-l)
end
