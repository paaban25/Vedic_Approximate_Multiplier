function [sum, carry] = approximate_adder6(a, b, cin)
%APPROXIMATE_ADDER6 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder6(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER6: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end
    
    sum   = ((~a) & (b | cin)) | (b & cin);               % sum logic
    carry = (a & b) | (b & cin) | (a & cin);              % carry logic
end
