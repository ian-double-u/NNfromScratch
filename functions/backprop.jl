function backprop(net::Network,input::Vector{Float64},label::Vector{Float64})::Vector{Vector{Float64}}
    feedforward!(net,input)

    # δ^L = ∇C_a ⊙ σ'(z^L)
    output_error = net.∇C_a(net.neurons[end],label).*net.act_p(net.z[end])
    errors = [output_error]

    for i=1:(length(net.layers)-1)
        # δ^l=((w^l+1)T δ^l+1) ⊙ σ′(z^l)
        next_error = (net.weights[length(net.layers)-i+1]*errors[1]).*net.act_p(net.z[length(net.layers)-i])
        prepend!(errors,next_error)
    end

    return errors, net.neurons
end
