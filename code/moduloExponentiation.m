function [ output ] = moduloExponentiation( base, exponent, modulus )
%  moduloExponentiation calculates (a^b)%c
%  This algorithm uses the following logic to reduce computational time to O(log2(b))
%
%            {  (a^2)^(b/2)         if b is even and b > 0
%      a^b = {  a*(a^2)^((b-1)/2)   if b is odd
%            {  1                   if b = 0

% ELEN3015 Lab3
% Tyson Cross 1239448

    if exponent == modulus
        output = 0;
        return
    end
    
    % Algorithm only useful with integer modulo values
    base        = makeInt(base);
    exponent    = makeInt(exponent);
    modulus     = makeInt(modulus);
    
    largest_int = realmax;

    output      = 1;
    base    	= mod(base,modulus);                    % <= overflow

    while (exponent > 0)
        if mod(exponent,2) == 1                       	% b is odd
            output = mod(output*base,modulus);
            assert((base < largest_int) && (output < largest_int) && ~isinf(output), 'Overflow');
        end
        base = mod(base*base,modulus);
        assert(base < largest_int && ~isinf(base), 'Overflow');
%         exponent = bitshift(exponent,-1);
        exponent = floor(exponent/2);                   % floor() slightly faster than bitshift()
    end
    
    output = double(mod(output,modulus));
end

