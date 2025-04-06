function out = dec2bin_custom (in)

    if ~isscalar(in) || in < 0 || in > 2^32 || in ~= floor(in)
        error('Input must be an integer between 0 and 2^32.');
    end

    out=str2double(dec2bin(in));

end