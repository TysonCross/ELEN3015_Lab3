function [ primality ] = isProbablyPrime( n, k )
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
            primality = false; return
        case 1
            primality = false; return
        case 2
            primality = true; return
        case 3
            primality = true; return
        case 4
            primality = false; return
        case 5
            primality = true; return
    end
    
    % check if n is even
    if bitand(n,1)==0
        primality = false; return
    end
    
    % check if n is multiple of 3 or 5
    if mod(n,3)==0
        primality = false; return
    elseif mod(n,5)==0
        primality = false; return
    end
    
    % split into the form (2^r)·d , with d odd
    numBinaryDivisions = 1;
    oddPartNum = (n-1)/2;
    while bitand(oddPartNum,1)==0
        oddPartNum = oddPartNum/2;
        numBinaryDivisions = numBinaryDivisions + 1;
    end
    
	% "Witness" loop
    primality = true;
    rng('shuffle');
    for i=1:k
        randomNum = randi([2, n-1]);
        randomNumPower = squareModuloExponentiation(randomNum,oddPartNum,n);
        if (numBinaryDivisions==1) && (randomNumPower~=1) && (randomNumPower~=n-1)
            primality = false; return
        elseif (randomNumPower==1) || (randomNumPower==n-1)
            % Stop the loop, leave result as true (might be a strong liar)
            % Don't start the j loop, but continue with the while loop
        else
            % Can't make prediction for this witness yet. Start squaring randomNumPower mod n
            for j=1:numBinaryDivisions-1
               randomNumPower = squareModuloExponentiation(randomNumPower,2,n);
               if randomNumPower==1
                   % Definitely not a prime
                   primality =  false; return
               elseif randomNumPower==(n-1)
                   % Probably a prime, but might be a strong liar
                   % We need to check remaining witnesses
                   break
               end
               
               if j == (numBinaryDivisions-1)
                   % if we left the j loop without breaking
                   % then current randomNum is a witness
                   % for n as a composite (non-prime)
                   primality=false; return
               end
            end
        end
    end
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