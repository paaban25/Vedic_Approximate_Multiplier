function [sum, carry] = approximate_adder3(a, b, cin)
%APPROXIMATE_ADDER3 Simulates an approximate 1-bit adder
%   [sum, carry] = approximate_adder3(a, b, cin)
%   Inputs: a, b, cin - binary values (0 or 1)
%   Outputs: sum, carry - binary outputs

    if ~all(ismember([a, b, cin], [0, 1]))
        error('APPROXIMATE_ADDER3: Invalid input: Inputs a, b, and cin must be binary (0 or 1).');
    end

    w2 = b | cin;                  % OR operation: w2 = b OR cin
    w1 = mux_21(a, b, cin);        % First MUX: select a or b based on cin
    carry = mux_21(a, w1, w2); % Second MUX: select a or w1 based on w2
    sum = ~w2;                 % NOT operation on w2
end
