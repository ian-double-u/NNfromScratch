function evaluate(net::Network,test::Vector{Tuple{Vector{Float64},Vector{Float64}}},rule::Function)::Float64
    c = sum([1 for t in test if rule(feedforward(net,t[0])) == rule(t[1])])
    return "$(c) / $(length(test)) = $(100*(c/length(test)))%"
end
