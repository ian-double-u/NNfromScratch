using Random
using JSON

mutable struct Network
    layers::Vector{Int64}
    neurons::Vector{Vector{Float64}}
    weights::Vector{Matrix{Float64}}
    biases::Vector{Vector{Float64}}
    z::Vector{Vector{Float64}}
    batch::Int64
    epochs::Int64
    η::Float64
    act::Function
    act_p::Function
    C::Function
    ∇C_a::Fucntion

    function Network(;layers, batch, epochs, η, act, act_p, C, ∇C_a)
        new(layers,
            neurons = [[0.0 for j=1:layers[i]] for i=1:length(layers)],
            weights = [randn(Float64,layers[i+1],layers[i]) for i=1:length(layers)],
            biases = [rand!(MersenneTwister(1234), zeros(layers[i])) for i=2:length(layers)],
            z = [[0.0 for j=1:layers[i]] for i=1:length(layers)],
            batch, epochs, η, act, act_p, C, ∇C_a)
    end
end

function feedforward!(net::Network,input::Vector{Float64})::Vector{Float64}
    net.layers[1] = input

    # a^(l+1) = σ(w^l*a^l + b^1)
    for i=1:(length(net.layers)-1)
        net.z[i] = net.weights[i]*net.neurons[i] + net.biases[i]
        net.neurons[i+1] = net.z[i].net.act()
    end

    return net.neurons[end]
end

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

function sgd!(net::Network,train::Vector{Tuple{Vector{Float64},Vector{Float64}}})::Nothing
    for e=1:net.epochs
        train = shuffle(train)
        batches = [train[(1+(i*net.batch)):((i+1)*net.batch)] for i=0:(Int(length(train)/net.batch)-1)]

        for b in batches
            errors = []
            activations = []

            for x in b
                push!(errors,backprop(net,x[1],x[2])[1])
                push!(activations,backprop(net,x[1],x[2])[2])
            end

            # change w & b using errors = []
            for w1=1:length(net.weights)
                net.weights[wl] = net.weights[wl].-(net.η/net.batch).*sum([errors[e][wl]*transpose(activations[e][wl-1]) for e=1:length(errors)])

            end
            for bl=length(net.biases)
                net.biases[bl] = net.biases[bl].-(net.η/net.batch).*sum([errors[e][bl] for e=1:length(errors)])

            end
        end
    end

    return nothing
end

function evaluate(net::Network,test::Vector{Tuple{Vector{Float64},Vector{Float64}}},rule::Function)::Float64
    c = sum([1 for t in test if rule(feedforward(net,t[0])) == rule(t[1])])
    return "$(c) / $(length(test)) = $(100*(c/length(test)))%"
end

function dump(net::Network,file_str::String)::Nothing
    dict = Dict("layers" => net.layers,
                "neurons" => net.neurons,
                "weights" => net.weights,
                "biases" => net.biases,
                "z" => net.z,
                "batch" => net.batch,
                "epochs" => net.epochs,
                "η" => net.η)

    open(file_str, "w") do file
        write(file, JSON.json(dict))
    end

    println("Saved to $(file_str)")
    return nothing
end

function load!(net::Network,file_str::String)::Network
    dict = Dict()

    open(file_str, "r") do file
        global dict
        dict = JSON.parse(file)
    end

    net.weights = dict["weights"]
    net.biases = dict["biases"]

    return net
end

function sigmoid(x::Float64)::Float64
    return (MathConstants.e^x)/(1 + MathConstants.e^x)
end

function sigmoid_prime(x::Float64)::Float64
    return (MathConstants.e^x)/(1 + 2MathConstants.e^x + MathConstants.e^(2x))
end

function MSE(a::Vector{Float64},l::Vector{Float64})::Float64
    return 0.5*(sum((a.-l).^2))
end

function MSE_p(a::Vector{Float64},l::Vector{Float64})::Float64
    return sum(a.-l)
end

function mnist_load(file_str::String)::Tuple
    dict = Dict()

    open(file_str, "r") do file
        global dict
        dict = JSON.parse(file)
    end

    # <- ::Vector{Tuple{Vector{String},String}}
    train = dict["training"]
    valid = dict["validation"]
    test = dict["test"]

    # -> ::Vector{Tuple{Vector{Float64},Float64}}
    for t in train
        t[1] = parse(Float64,t[1])

        for s in t[0]
            s = parse(Float64,s)
        end
    end

    for t in valid
        t[1] = parse(Float64,t[1])

        for s in t[0]
            s = parse(Float64,s)
        end
    end

    for t in test
        t[1] = parse(Float64,t[1])

        for s in t[0]
            s = parse(Float64,s)
        end
    end

    return (train,valid,test)
end
