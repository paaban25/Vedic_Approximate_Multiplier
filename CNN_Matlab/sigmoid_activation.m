function out = sigmoid_activation(x)
    out = 1 ./ (1 + exp(-x));
end