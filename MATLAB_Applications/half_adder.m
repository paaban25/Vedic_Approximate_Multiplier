function [sum_out, carry] = half_adder(a, b)
    % MATLAB implementation of a half adder
    % Inputs must be binary: 0 or 1

    % Input validation
    if ~(a == 0 || a == 1) || ~(b == 0 || b == 1)
        error('Inputs a and b must be binary (0 or 1)');
    end

    % Half adder logic
    sum_out = xor(a, b);
    carry = a & b;
end
