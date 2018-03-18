
clc
clear all

keylength = 16;
p = generatePrime(16);
q = generatePrime(20);
n = q*p;
totient = (p-1)*(q-1);

s = generatePrime(keylength); % value must be coprime with totient (default=65537)
if gcd(s,totient)~=1
    warning('The key and totient are not co-prime')
end
h = 
%private_key <- inverse of totient
