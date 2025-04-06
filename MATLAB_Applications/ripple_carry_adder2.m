function [Sum, Cout] = ripple_carry_adder2(A, B, Cin,N)
    % Set bit-width
    % N = 16;

    % Input validation
    if A < 0 || A > 2^N - 1 || B < 0 || B > 2^N - 1
        error('Inputs A and B must be in the range.');
    end
    if ~ismember(Cin, [0, 1])
        error('Cin must be either 0 or 1');
    end

    % Convert to binary strings of N bits
    A_bin = dec2bin(A);
    B_bin = dec2bin(B);

    % Pad to N bits (in case input has fewer bits)
    A_bin = pad(A_bin, N, 'left', '0');
    B_bin = pad(B_bin, N, 'left', '0');

    % Convert to numeric arrays
    A_bits = double(A_bin) - '0';
    B_bits = double(B_bin) - '0';

    % Initialize carry
    carry = zeros(1, N + 1);
    carry(1) = Cin;

    % Output sum
    Sum = zeros(1, N);

    % Ripple-Carry Logic
    for i = N:-1:1
        [sum_bit, carry_out] = approximate_adder2(A_bits(i), B_bits(i), carry(N - i + 1));
        Sum(i) = sum_bit;
        carry(N - i + 2) = carry_out;
    end

    Sum= num2str(Sum);
    Sum=bin2dec(Sum);

    % Final Carry-out
    Cout = carry(end);
end
