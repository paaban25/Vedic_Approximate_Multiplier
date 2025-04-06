function out = vedic_32x32(a, b)
    % Inputs:
    %   a, b - 32-bit binary vectors [MSB ... LSB]
    % Output:
    %   out  - 64-bit binary product vector

    if length(a) ~= 32 || length(b) ~= 32
        error('Inputs must be 32-bit binary vectors.');
    end

    % Split into 16-bit parts (MSB to LSB)
    a_low  = a(17:32);  % a[15:0]
    a_high = a(1:16);   % a[31:16]
    b_low  = b(17:32);  % b[15:0]
    b_high = b(1:16);   % b[31:16]

    % 16x16 Vedic multiplications
    v_16x16_1o = vedic_16x16(a_low,  b_low);    % LSB
    v_16x16_2o = vedic_16x16(a_low,  b_high);
    v_16x16_3o = vedic_16x16(a_high, b_low);
    v_16x16_4o = vedic_16x16(a_high, b_high);   % MSB

    % Add middle partial products
    [ad_32b_1s, ad_32b_1c] = adder_32b(v_16x16_2o, v_16x16_3o);

    % Add shifted upper bits of v_16x16_1o with previous result
    [ad_32b_2s, ad_32b_2c] = adder_32b([zeros(1,16), v_16x16_1o(1:16)], ad_32b_1s);

    % Add shifted result with MSB product
    [ad_32b_3s, ad_32b_3c] = adder_32b([zeros(1,16), ad_32b_2s(1:16)], v_16x16_4o);

    % Final product
    out = [ad_32b_3s, ad_32b_2s(17:32), ad_32b_1s(17:32)];
end
