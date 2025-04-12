function output = MaxPooling2D_layer(input,pool_size,stride)
    % output will be of size Hout X Wout X numFilters

    [HInput,WInput,numFilters]=size(input);
    Hout=floor((HInput-pool_size)/stride)+1;
    Wout=floor((WInput-pool_size)/stride)+1;

    output=zeros(Hout,Wout,numFilters);

    for f = 1:numFilters
        for i = 1:Hout
            for j = 1:Wout
                row_start = (i-1)*stride + 1;
                col_start = (j-1)*stride + 1;

                window = input(row_start:row_start+pool_size-1, ...
                               col_start:col_start+pool_size-1, f);

                output(i, j, f) = max(window(:));
            end
        end
    end

end