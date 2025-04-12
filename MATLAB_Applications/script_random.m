% Test Vedic 32x32 multiplier

% Generate random test cases
num_tests = 10;
pass_count = 0;

for i = 1:num_tests
    % Generate random 32-bit integers
    a_dec = randi([0, 2^32-1]);
    b_dec = randi([0, 2^32-1]);

    % Convert to 32-bit binary vectors (MSB to LSB)
    a_bin = dec2bin(a_dec, 32) - '0';
    b_bin = dec2bin(b_dec, 32) - '0';

    % Get output from vedic_32x32
    out_bin = vedic_32x32(a_bin, b_bin);

    % Convert result back to decimal
    out_dec = bin2dec(char(out_bin + '0'));

    % Ground truth using MATLAB multiplication
    expected = uint64(a_dec) * uint64(b_dec);

    % Compare
    if out_dec == expected
        fprintf('Test %d PASSED\n', i);
        pass_count = pass_count + 1;
    else
        fprintf('Test %d FAILED: Expected %u, Got %u\n', i, expected, out_dec);
    end
end

fprintf('\n%d/%d Tests Passed.\n', pass_count, num_tests);
