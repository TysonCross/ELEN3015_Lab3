function [ primes ] = computePrimes( limit )
% computePrimes() uses the Rabin-Miller primality test to compute primes up
% until the input limit

%     if log(limit)~=0
%         primes = zeros(floor(limit/log(limit)));
%     end
    
    primes(1:4) = [2 3 5 7];
    start = 11;
    i=5;
for n=start:limit
    if RabinMiller(n)
        primes(i) = n;
        i=i+1;
    end
end