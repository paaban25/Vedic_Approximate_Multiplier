function out = vedic_4x4(a, b)
    % Inputs:
    %   a, b - 4-bit binary vectors [a4 a3 a2 a1] (MSB to LSB)
    % Output:
    %   out  - 8-bit binary product vector

    % Input validation
    % if length(a) ~= 4 || length(b) ~= 4
    %     error('Inputs must be 4-bit binary vectors.');
    % end

    a=dec2bin(a);
    b=dec2bin(b);
    a=a-'0';
    b=b-'0';
    

    % Split into 2-bit segments
    a_low  = a(3:4);  % a[1:0]
    a_high = a(1:2);  % a[3:2]
    b_low  = b(3:4);  % b[1:0]
    b_high = b(1:2);  % b[3:2]

    % Perform 2x2 multiplications
    v_2x2_1o = vedic_2x2(a_low,  b_low);
    v_2x2_2o = vedic_2x2(a_low,  b_high);
    v_2x2_3o = vedic_2x2(a_high, b_low);
    v_2x2_4o = vedic_2x2(a_high, b_high);

    % First 4-bit adder
    [ad_4b_1s, ad_4b_1c] = adder_4b(v_2x2_2o, v_2x2_3o,0);

    % Second 4-bit adder: add upper bits of v_2x2_1o and ad_4b_1s
    [ad_4b_2s, ad_4b_2c] = adder_4b([0 0 v_2x2_1o(1:2)], ad_4b_1s,0);

    % Third 4-bit adder
    [ad_4b_3s, ad_4b_3c] = adder_4b([ad_4b_1c 0 ad_4b_2s(1:2)], v_2x2_4o,0);

    % Combine final output
    out = [ad_4b_3s, ad_4b_3s(3:4), v_2x2_1o(3:4)];
end
