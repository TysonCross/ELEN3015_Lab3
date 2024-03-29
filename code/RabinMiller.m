function [ primality, numBinaryDivisions, oddPartNum ] = RabinMiller( n , k )
% RabinMiller tests an input number for primality using the Rabin-Miller test
% returns false if the test returns composite, and true if likely prime

% ELEN3015 Lab3
% Tyson Cross 1239448

    if nargin < 2
        k = 7;     % confidence of testing (number of witnesses/bases)
    end

    n = abs(makeInt(n));

    % shortcuts for n < 6
    switch n
        case 0
            primality = false; return
        case 1
            primality = false; return
        case 2
            primality = true;  return
        case 3
            primality = true;  return
        case 4
            primality = false; return
        case 5
            primality = true;  return
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
    
    % split into the form (2^r)*d , with d odd
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
        randomNum = randi([2, n-1]);            % alternatively, we could use the first k primes
        randomNumPower = moduloExponentiation(randomNum,oddPartNum,n);
        if (numBinaryDivisions==1) && (randomNumPower~=1) && (randomNumPower~=n-1)
            primality = false; return
        elseif (randomNumPower==1) || (randomNumPower==n-1)
            % Stop the loop, leave result as true (might be a strong liar)
            % Don't start j loop, continue with other witnesses (in outer for loop)
        else
            % Cannot make prediction for this witness yet. Start squaring randomNumPower mod n
            for j=1:numBinaryDivisions-1
               randomNumPower = moduloExponentiation(randomNumPower,2,n);
               if randomNumPower==1
                   % Definitely not a prime
                   primality =  false; return
               elseif randomNumPower==(n-1)
                   % Probably prime, but might be strong liar: need to check rest of witnesses
                   break
               end
               
               if j == (numBinaryDivisions-1)
                   % if we left the j loop without breaking
                   % then current randomNum is a witness
                   % to n as a composite (non-prime)
                   primality=false; return
               end
            end
        end
    end
end