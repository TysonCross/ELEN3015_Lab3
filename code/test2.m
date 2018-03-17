clc
clear all

for n=1:10000
    if isprime(n)~=isProbablyPrime(n)
        disp(['Primality test failed for ',num2str(n)])
    end
end