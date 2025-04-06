function [Sum, Cout] = ripple_carry_adder(A, B, Cin, model, N)
    % Input validation
    if A < 0 || A >= 2^N || B < 0 || B >= 2^N || ~ismember(Cin, [0,1])
        error('Invalid input. A and B must be in [0, 2^N-1], Cin must be 0 or 1.');
    end

    % Call the appropriate approximate ripple carry adder
    switch model
        case 1
            [Sum, Cout] = ripple_carry_adder1(A, B, Cin, N);
        case 2
            [Sum, Cout] = ripple_carry_adder2(A, B, Cin, N);
        case 3
            [Sum, Cout] = ripple_carry_adder3(A, B, Cin, N);
        case 4
            [Sum, Cout] = ripple_carry_adder4(A, B, Cin, N);
        case 5
            [Sum, Cout] = ripple_carry_adder5(A, B, Cin, N);
        case 6
            [Sum, Cout] = ripple_carry_adder6(A, B, Cin, N);
        case 7
            [Sum, Cout] = ripple_carry_adder7(A, B, Cin, N);
        case 8
            [Sum, Cout] = ripple_carry_adder8(A, B, Cin, N);
        case 9
            [Sum, Cout] = ripple_carry_adder9(A, B, Cin, N);
        case 10
            [Sum, Cout] = ripple_carry_adder10(A, B, Cin, N);
        case 11
            [Sum, Cout] = ripple_carry_adder11(A, B, Cin, N);
        otherwise
            error('Invalid model number. Model should be between 1 and 11.');
    end
end
