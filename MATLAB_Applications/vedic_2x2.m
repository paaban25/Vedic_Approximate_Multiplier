function out = vedic_2x2(a, b)
    % MATLAB function to implement 2x2 Vedic multiplier
    % a, b are 2-bit input vectors in the form of [a1 a0] and [b1 b0]
    % Output is a 4-bit product vector in decimal

    % Input validation
    if length(a) ~= 2 || length(b) ~= 2
        error('Inputs must be 2-bit binary vectors.');
    end

    if any(~ismember(a, [0 1])) || any(~ismember(b, [0 1]))
        error('Inputs must only contain binary values (0 or 1).');
    end

    % AND gates
    ab00 = a(2) & b(2);  % a[0] & b[0]
    ab01 = a(2) & b(1);  % a[0] & b[1]
    ab10 = a(1) & b(2);  % a[1] & b[0]
    ab11 = a(1) & b(1);  % a[1] & b[1]

    % Half adders
    [ha1s, ha1c] = half_adder(ab01, ab10);
    [ha2s, ha2c] = half_adder(ab11, ha1c);

    % Output bits
    out = [ha2c ha2s ha1s ab00];  % 4-bit binary vector
end
