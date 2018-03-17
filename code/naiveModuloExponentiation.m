function [ output ] = naiveModuloExponentiation( base, exponent, modulus )
%  naiveModuloExponentiation calculates (a^b)%c
%  This algorithm uses computational operations of O(b)
    
    % Algorithm only useful with integer modulo values
    base = makeInt(base);
    exponent = makeInt(exponent);
    modulus = makeInt(modulus);
    
    if exponent == 1
        output = 0;
        return
    end
    
    output = 1; 
    i = 0;
    
    while i<exponent
        output = output*base;
        output = mod(output,modulus) ;        % Because mod(a*b,c) = mod(a,c)*mod(mod(b,c)),c)
        i = i + 1;
    end
    
    output = mod(output,modulus);
end

