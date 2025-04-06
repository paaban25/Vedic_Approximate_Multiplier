function [sum, carry] = approximate_adder4(a, b, cin)
%APPROXIMATE_ADDER4 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder4(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER4: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w = (a & cin) | b;                            % Intermediate wire w
    carry = w;                                % carry = w
    sum = (a & b & cin) | ((~w) & cin);       % sum expression
end
