Network()
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
    C_p::Function
    ∇C_a(a,l)::Fucntion #takes activation layer a, label l

    # __constructor__ (use randn(Float64,n,m))
end
