% Input combinations (a, b, cin)
inputs = [
    0 0 0;
    0 0 1;
    0 1 0;
    0 1 1;
    1 0 0;
    1 0 1;
    1 1 0;
    1 1 1
];

% Loop through each approximate adder
for adder_num = 1:11
    fprintf('--- approximate_adder%d ---\n', adder_num);
    for i = 1:size(inputs,1)
        a = inputs(i,1);
        b = inputs(i,2);
        cin = inputs(i,3);

        % Dynamic function call
        func = str2func(sprintf('approximate_adder%d', adder_num));
        [sum_out, carry_out] = func(a, b, cin);

        fprintf('a=%d, b=%d, cin=%d => sum=%d, carry=%d\n', a, b, cin, sum_out, carry_out);
    end
    fprintf('\n');
end
