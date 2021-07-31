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
