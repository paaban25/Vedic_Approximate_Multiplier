function out = matrix_multiplication(a, b)
    sizeA = size(a);
    sizeB = size(b);
    
    if sizeA(2) ~= sizeB(1)
        error("Matrix Multiplication not Possible");
    end

    % Initialize output matrix with zeros
    out = zeros(sizeA(1), sizeB(2));

    % Manual matrix multiplication using approx_multiplier
    for i = 1:sizeA(1)
        for j = 1:sizeB(2)
            sum = 0;
            for k = 1:sizeA(2)
                prod = approx_multiplier(a(i, k), b(k, j));
                sum = sum + prod;
            end
            out(i, j) = sum;
        end
    end
end
