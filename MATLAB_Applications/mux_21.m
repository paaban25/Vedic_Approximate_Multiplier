function out = mux_21(a, b, s)
%MUX_21 2-to-1 multiplexer
%   out = mux_21(a, b, s) returns a if s == 0, otherwise returns b.

    if s == 0
        out = a;
    elseif s == 1
        out = b;
    else
        error('Select input s must be 0 or 1');
    end
end
