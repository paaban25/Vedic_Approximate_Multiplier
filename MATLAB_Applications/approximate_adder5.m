function [sum, carry] = approximate_adder5(a, b, cin)
%APPROXIMATE_ADDER5 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder5(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER5: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w = (a & b) | (b & cin) | (a & cin);   % Majority function
    carry = w;                         % carry = w
    sum = ~w;                          % sum = NOT(w)
end
