function out = vedic_16x16(a, b)
    % Inputs:
    %   a, b - 16-bit binary vectors [MSB ... LSB]
    % Output:
    %   out  - 32-bit binary product vector

    if length(a) ~= 16 || length(b) ~= 16
        error('Inputs must be 16-bit binary vectors.');
    end

    % Split into 8-bit parts (MSB to LSB)
    a_low  = a(9:16);  % a[7:0]
    a_high = a(1:8);   % a[15:8]
    b_low  = b(9:16);  % b[7:0]
    b_high = b(1:8);   % b[15:8]

    % Perform 8x8 Vedic multiplications
    v_8x8_1o = vedic_8x8(a_low,  b_low);    % LSB
    v_8x8_2o = vedic_8x8(a_low,  b_high);
    v_8x8_3o = vedic_8x8(a_high, b_low);
    v_8x8_4o = vedic_8x8(a_high, b_high);   % MSB

    % Add middle partial products
    [ad_16b_1s, ad_16b_1c] = adder_16b(v_8x8_2o, v_8x8_3o);

    % Add shifted upper bits of v_8x8_1o with previous result
    [ad_16b_2s, ad_16b_2c] = adder_16b([zeros(1,8), v_8x8_1o(1:8)], ad_16b_1s);

    % Add carry from previous + shifted result with MSB product
    [ad_16b_3s, ad_16b_3c] = adder_16b([ad_16b_1c, zeros(1,7), ad_16b_2s(1:8)], v_8x8_4o);

    % Concatenate all parts for final result
    out = [ad_16b_3s, ad_16b_2s(9:16), ad_16b_1s(9:16)];
end
