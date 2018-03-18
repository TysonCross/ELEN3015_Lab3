function [ gcd, sa, ta] = GCD( a, b )
% GCD() returns the greatest common divisor between two numbers
% It implements Euclid's extended algorithm
    
    q = 1;
    r = 1;
    sa = 1;
    sb = 0;
    ta = 0;
    tb = 1;
   
    while b~=0;
        q=floor(a/b);
        r=a-q*b;
        a=b;
        b=r;
        sc=sa-q*sb;
        sa=sb;
        sb=sc;
        tc=ta-q*tb;
        ta=tb;
        tb=tc;
    end
       
    gcd = a;
end