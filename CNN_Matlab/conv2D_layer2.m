function output = conv2D_layer2(input, filters,bias, stride)
    [HInput,WInput,numFiltersInput]=size(input);
    [HFilters,WFilters,numFiltersInp,numFiltersOut]=size(filters);
    if (numFiltersInput~=numFiltersInp)
        error("Numbers of filters should match");
    end
    % size of bias is 1 X numFiltersOut
    

    H_out = floor((HInput - HFilters) / stride) + 1;
    W_out = floor((WInput - WFilters) / stride) + 1;

    output = zeros(H_out, W_out, numFiltersOut);

    for f = 1:numFiltersOut
        for i = 1:H_out
            for j = 1:W_out
                
                patch = input( ...
                    (i-1)*stride + 1 : (i-1)*stride + HFilters, ...
                    (j-1)*stride + 1 : (j-1)*stride + WFilters, ...
                    :);
                
                product = element_multiplication(patch, filters(:,:,:,f));
                patch_sum = sum(product(:));
                output(i,j,f)=patch_sum+bias(f);
            end
        end
    end 

end