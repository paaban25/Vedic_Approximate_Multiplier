function out = vedic_8x8(a, b)
    % Inputs:
    %   a, b - 8-bit binary vectors [MSB ... LSB]
    % Output:
    %   out  - 16-bit binary product vector

    

    a=dec2bin(a);
    b=dec2bin(b);
    a=a-'0';
    b=b-'0';

    if length(a) ~= 8 || length(b) ~= 8
        error('Inputs must be 8-bit binary vectors.');
    end

    % Split into 4-bit parts
    a_low  = a(5:8);  % a[3:0]
    a_high = a(1:4);  % a[7:4]
    b_low  = b(5:8);  % b[3:0]
    b_high = b(1:4);  % b[7:4]

    % Perform 4x4 Vedic multiplications
    v_4x4_1o = vedic_4x4(a_low,  b_low);   % LSB product
    v_4x4_2o = vedic_4x4(a_low,  b_high);
    v_4x4_3o = vedic_4x4(a_high, b_low);
    v_4x4_4o = vedic_4x4(a_high, b_high);  % MSB product

    % Add middle partial products
    [ad_8b_1s, ad_8b_1c] = adder_8b(v_4x4_2o, v_4x4_3o,0);

    % Shift and add upper bits of first partial with previous result
    [ad_8b_2s, ad_8b_2c] = adder_8b([0 0 0 0 v_4x4_1o(1:4)], ad_8b_1s,0);

    % Final addition with upper 4x4 product
    [ad_8b_3s, ad_8b_3c] = adder_8b([ad_8b_2c 0 0 0 ad_8b_2s(1:4)], v_4x4_4o,0);

    % Final output composition
    out = [ad_8b_3s, ad_8b_2s(5:8), v_4x4_1o(5:8),0];
end
