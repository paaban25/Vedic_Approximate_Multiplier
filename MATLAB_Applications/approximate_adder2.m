function [sum, carry] = approximate_adder2(a, b, cin)
%APPROXIMATE_ADDER2 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder2(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER2: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w2 = a | b | cin;              % Equivalent to or gate
    w1 = mux_21(a, b, cin);        % Select between a and b based on cin
    carry = mux_21(a, w1, w2); % Second mux operation
    sum = w2;                  % sum is directly assigned w2
end
