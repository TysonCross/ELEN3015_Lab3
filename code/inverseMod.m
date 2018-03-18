function [ inverse ] = inverseMod( a, b )
% inverseMod() returns the inverse modulo, using extended euclidian algorithm
    [gcd, x, y] = GCD( a, b);
    if gcd ~=1
        error('Modular inverse does not exist')
    else
        inverse = mod(x,b);
    end
end