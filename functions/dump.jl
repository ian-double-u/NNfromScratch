using JSON
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
