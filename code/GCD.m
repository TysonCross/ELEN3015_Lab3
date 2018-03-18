function [ gcd ] = GCD( a, b )
% GCD() returns the greatest common divisor between two numbers
% It implements Euclid's extended algorithm

    X = [0,1];
    U = [1,0];
    
    while a~=0
           quotient = floor(b/a);
           r=mod(b,a);
           M = X-quotient*U;
           b=a;
           a=r;
           U=M;
    end
    gcd = b;
end

% def modinv(a,n):
%   t,nt=0,1
%   r,nr=n,a
%   while nr!=0:
%     q=r//nr
%     t,nt=nt,t-q*nt
%     r,nr=nr,r-q*nr
%   if r>1:
%     return None
%   while t<0:
%     t+=n
%   return(t)