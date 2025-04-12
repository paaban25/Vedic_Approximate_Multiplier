function out = approx_multiplier(a, b)
    if ~isscalar(a) || ~isscalar(b)
        error("Only scalars can be multiplied using this!");
    end
    
    out = a * b;
end
