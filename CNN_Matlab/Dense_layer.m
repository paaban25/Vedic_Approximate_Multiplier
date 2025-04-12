function output = Dense_layer (input, weights, bias,n_neurons)

    % input: (n_input × 1)
    % weights: (n_neurons × n_input)
    % bias: (n_neurons × 1)

    if(n_neurons~=size(weights,1))
        error("Dimensions of Weights are not according to Number of Neurons");
    end

    output=matrix_multiplication(weights,input) + bias;
end