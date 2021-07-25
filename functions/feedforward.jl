function feedforward!(net::Network,input::Vector{Float64})::Vector{Float64}
    net.layers[1] = input

    # a^(l+1) = σ(w^l*a^l + b^1)
    for i=1:(length(net.layers)-1)
        net.z[i] = net.weights[i]*net.neurons[i] + net.biases[i]
        net.neurons[i+1] = net.z[i].net.act()
    end

    return net.neurons[end]
end
