function [sum, carry] = approximate_adder10(a, b, cin)
%APPROXIMATE_ADDER10 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder10(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs
    
    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER10: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end
    
    sum   = b;                                            % sum is directly b
    carry = (a & b) | (b & cin) | (cin & a);              % carry logic
end
