using JSON
function dump(net::Network)::Nothing
    # dictionary to write
    dict = Dict("layers" => net.layers,
                "neurons" => net.neurons,
                "weights" => net.weights,
                "biases" => net.biases,
                "z" => net.z,
                "batch" => net.batch,
                "epochs" => net.epochs,
                "η" => net.η)

    open("net.json", "w") do file
        write(file, JSON.json(dict))
    end

    println("Saved $(net) to net.json")
    return nothing
end
