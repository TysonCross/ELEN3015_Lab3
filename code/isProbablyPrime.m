function [ result ] = isProbablyPrime( n, k )
% isProbablyPrime test an input number for primality using the Rabin-Miller test

    % confidence of testing
    if nargin < 2
        k = 7;
    end

    % make sure n is an positive integer
    n = abs(makeInt(n));

    % shortcuts for n < 6
    switch n
        case 0
            result = false; return
        case 1
            result = false; return
        case 2
            result = true; return
        case 3
            result = true; return
        case 4
            result = false; return
        case 5
            result = true; return
    end
    
    % check if n is even
    if bitand(n,1)==0
        result = false; return
    end
    
    % split into the form (2^r)·d , with d odd
    numBinaryDivisions = 0;
    oddPartNum = n-1;
    while bitand(oddPartNum,1)==0
        oddPartNum = floor(oddPartNum/2);
        numBinaryDivisions = numBinaryDivisions + 1;
    end

%     for 
    for i=1:k          % "Witness" loop
        a = randi([2, n-1]);
        x = squareModuloExponentiation(a,oddPartNum,n);
        if (x~=1) && (x~=n-1)
            j=0;
            while j<numBinaryDivisions
               x = squareModuloExponentiation(x,2,n);
               if x==1
                   result =  false; return
               elseif x==(n-1)
                   break
               end
               j=j+1;
            end
            if j==numBinaryDivisions
               result =  false; return
            end
        end
    end
    result = true;
end

% Input #1: n > 3, an odd integer to be tested for primality;
% Input #2: k, a parameter that determines the accuracy of the test
% Output: composite if n is composite, otherwise probably prime

% write n ? 1 as (2^r)·d with d odd by factoring powers of 2 from n ? 1
% WitnessLoop: repeat k times:
%    pick a random integer a in the range [2, n ? 2]
%    x ? a^d mod n
%    if x = 1 or x = n ? 1 then
%       continue WitnessLoop
%    repeat r ? 1 times:
%       x ? x^2 mod n
%       if x = 1 then
%          return composite
%       if x = n ? 1 then
%          continue WitnessLoop
%    return composite
% return probably prime