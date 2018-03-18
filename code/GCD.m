function [ gcd ] = GCD( a, b )
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
end

% % mod(a,b):
%   x=0
%   y=1
%   while a~=0:
%     q=floor(b/a)
%     x=y
%     y=x-q*y
%     b=a
%     a=b-q*a
%   if b>1:
%     return None
%   while x<0:
%     x+=b
%   return(x)