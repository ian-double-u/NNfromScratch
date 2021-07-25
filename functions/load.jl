Using JSON
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
