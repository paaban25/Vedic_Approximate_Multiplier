function out = element_multiplication (a,b)
    sizeA = size(a);
    sizeB = size(b);

    if sizeA ~= sizeB
        error("Matrix Multiplication not Possible");
    end

    % Initialize output matrix with zeros
    out = zeros(sizeA(1), sizeA(2));

    for i=1:sizeA(1)
        for j=1:sizeA(2)
            out(i,j)=approx_multiplier(a(i,j),b(i,j));
        end
    end
end