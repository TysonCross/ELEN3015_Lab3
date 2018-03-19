function [ inverse ] = inverseMod( a, b )
% inverseMod() returns the inverse modulo, using extended euclidian algorithm

% ELEN3015 Lab3
% Tyson Cross 1239448

    [gcd, x, y] = GCD( a, b);
    
    if gcd ~=1
        error('Modular inverse does not exist')
    else
        inverse = mod(x,b);
    end
end