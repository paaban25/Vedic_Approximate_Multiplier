function out = bin2dec_custom(input_val)
    % Convert numeric input to string
    if isnumeric(input_val)
        % Check input is a non-negative integer
        if ~isscalar(input_val) || input_val < 0 || input_val ~= floor(input_val)
            error('Input must be a non-negative integer.');
        end
        bin_str = num2str(input_val);
    elseif ischar(input_val) || isstring(input_val)
        bin_str = char(input_val);  % Convert string to char
    else
        error('Input must be a binary number or binary string.');
    end

    % Validate binary digits (only 0s and 1s)
    if ~all(bin_str == '0' | bin_str == '1')
        error('Input must contain only binary digits (0 and 1).');
    end

    % Convert to decimal
    out = bin2dec(bin_str);

    % Range check: must be within [0, 2^32]
    if out > 2^32-1
        error(' Input out of range.');
    end
end
