function [sum, carry] = approximate_adder9(a, b, cin)
%APPROXIMATE_ADDER9 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder9(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER9: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w = (a & cin) | b;      % Intermediate logic
    carry = w;          % Carry output
    sum   = ~w;         % Sum is NOT of w
end
