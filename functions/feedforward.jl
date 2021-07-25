function feedforward!(net::Network,act::Function,input::Vector{Float64})::Vector{Float64}
    net.layers[1] = input

    for i=2:length(net.layers)
        net.neurons[i+1] = (net.weights[i-1]*net.neurons[i] + net.biases[i-1]).act()
    end

    return net.neurons[end]
end
