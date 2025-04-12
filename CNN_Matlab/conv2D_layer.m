function output = conv2D_layer(input, filters, bias, stride)
    % Assuming padding='valid'
    % Size of Bias is 1 X numFilters
    [HImg, WImg, numChannelsImg] = size(input);
    [HFilter, WFilter, numChannelsFilter, numFilters] = size(filters);

    if numChannelsImg ~= numChannelsFilter
        error('Mismatch in number of channels between input and filters.');
    end

    H_out = floor((HImg - HFilter) / stride) + 1;
    W_out = floor((WImg - WFilter) / stride) + 1;

    output = zeros(H_out, W_out, numFilters);

    for f = 1:numFilters
        for i = 1:H_out
            for j = 1:W_out
                patch_sum = 0;
                for c = 1:numChannelsImg
                    row_start = (i - 1) * stride + 1;
                    row_end = row_start + HFilter - 1;
                    col_start = (j - 1) * stride + 1;
                    col_end = col_start + WFilter - 1;

                    input_patch = input(row_start:row_end, col_start:col_end, c);
                    filter_patch = filters(:, :, c, f);

                    mult_result = element_multiplication(input_patch, filter_patch);
                    patch_sum = patch_sum + sum(mult_result, 'all');
                end
                output(i, j, f) = patch_sum + bias(f);
            end
        end
    end
end


