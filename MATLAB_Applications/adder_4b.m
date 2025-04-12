function [sum_out, carry] = adder_4b(a, b, Cin)
    % MATLAB equivalent of 4-bit approximate adder with selectable model and Cin

    % Constants
    N = 4;
    model=1;

    % Input validation
    if any([a < 0, a >= 2^N, b < 0, b >= 2^N])
        error('Inputs a and b must be 4-bit unsigned integers (0 to 15)');
    end
    if ~(Cin == 0 || Cin == 1)
        error('Cin must be binary (0 or 1)');
    end
    if ~(model >= 1 && model <= 11)
        error('Model must be an integer from 1 to 11');
    end
    a=bin2dec(num2str(a));
    b=bin2dec(num2str(b));
    % Call ripple carry adder
    [sum_out, carry] = ripple_carry_adder(a, b, Cin, model, N);
    sum_out= dec2bin(sum_out)-'0';
end
