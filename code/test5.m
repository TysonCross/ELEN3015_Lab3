
clc
clear all

keylength = 16;
p = generatePrime(16);
q = generatePrime(20);
if gcd(p,q)~=1
    warning('P and Q are not co-prime')
end
n = q*p;
totient = (p-1)*(q-1);

s = generatePrime(keylength); % value must be coprime with totient (default=65537)
if gcd(s,totient)~=1
    warning('The key and totient are not co-prime')
end
h = inverseMod(totient,n); 
%private_key <- inverse of totient
% [a,x,y]=GCD(n,h);
% dec2hex(a)
% dec2hex(x)
% dec2hex(y)
disp(['p is ', num2str(dec2hex(p)), ' (', num2str(length(dec2bin(p))), '-bit)'])
disp(['q is ', num2str(dec2hex(q)), ' (', num2str(length(dec2bin(q))), '-bit)'])
disp(['n is ', num2str(dec2hex(n))])
disp(['Phi(n) is ', num2str(dec2hex((totient)))])
disp(['public key s is ', num2str(dec2hex(s)), ' (', num2str(length(dec2bin(s))), '-bit)'])
disp(['private key h is ', num2str(dec2hex(h))])