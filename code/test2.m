clc
clear all


% primality test
for n=1:2:99999999
    if isprime(n)~=isProbablyPrime(n)
        disp(['Primality test failed for ',num2str(n)])
    end
end

% generate primes
n = generatePrime(