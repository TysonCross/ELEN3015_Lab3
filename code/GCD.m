function [ gcd, x, y] = GCD( a, b )
% GCD() returns the greatest common divisor between two numbers
% It implements Euclid's extended algorithm

    X = [0,1];
    U = [1,0];
    
    while a~=0
           quotient = floor(b/a);
           remainder = mod(b,a);
           M = X-quotient*U;
           b=a;
           a=remainder;
           U=M;
    end
    gcd = b;
    x = M(1);
    y = M(2);
end