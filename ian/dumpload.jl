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
