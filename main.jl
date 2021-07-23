#Possible activation functions
function sigmoid(x::Number)
    return exp(x)/(exp(x)+1)
end

function relu(x::Number)
    if x > 0
        return x
    else
        return 0
    end
end

#Not sure if any of the below is in
#the right direction
struct Layer
    nodes :: Number
end

mutable struct buildabob
    activation :: Function
    hiddenlayers :: Number
    firstlayer :: Layer
    lastlayer :: Layer
end
