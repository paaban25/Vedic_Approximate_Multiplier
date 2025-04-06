function [sum_out, carry] = adder_8b(a, b, Cin)
    % MATLAB equivalent of 8-bit approximate adder with selectable model and Cin

    % Constants
    N = 8;
    model=1;

    % Input validation
    if a < 0 || a >= 2^N || b < 0 || b >= 2^N
        error('Inputs a and b must be 8-bit unsigned integers (0 to 255)');
    end
    if ~(Cin == 0 || Cin == 1)
        error('Cin must be binary (0 or 1)');
    end
    if ~(model >= 1 && model <= 11)
        error('Model must be an integer from 1 to 11');
    end

    % Call ripple carry adder
    [sum_out, carry] = ripple_carry_adder(a, b, Cin, model, N);
end
