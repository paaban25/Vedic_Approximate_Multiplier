function [sum, carry] = approximate_adder1(a, b, cin)
%APPROXIMATE_ADDER1 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder1(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs
    

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER1: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w1 = ~a;
    w2 = xor(b, cin);

    sum = mux_21(a, w1, w2);
    carry = mux_21(b, a, w2);
end
