function [ output ] = binaryModuloExponentiation( base, exponent, modulus )
%  moduloExponentiation calculates (a^b)%c
%  This algorithm uses the following logic to reduce computational operations to O(log2(b))
%
%            {  (a^2)^(b/2)         if b is even and b > 0
%      a^b = {  a*(a^2)^((b-1)/2)   if b is odd
%            {  1                   if b = 0
%
% b (the exponent) is treated as a binary number.

    if exponent == 1
        output = 0;
        return
    end
    
    % Algorithm only useful with integer modulo values
    base        = makeInt(base);
    exponent    = makeInt(exponent);
    modulus     = makeInt(modulus);
    
    largest_int = 1.3408e+154;

    output      = 1;
    base        = mod(base,modulus);
    
    while exponent > 0
        if (mod(exponent,2) == 1)                       % exponent is odd
            assert((base < largest_int) && (output < largest_int), 'Overflow');
            output = mod(output*base,modulus);          % <= potential overflow?
        end
        assert(base < largest_int , 'Overflow');
        exponent = bitshift(exponent,-1);
        base = mod(base*base,modulus);                  % square base <= potential overflow?
    end
    
    output = mod(output,modulus);
end
