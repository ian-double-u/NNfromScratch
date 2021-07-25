using Random
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
