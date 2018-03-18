
clc
clear all

% keylengths
keylength = 16;
plength = 16;
qlength = 20;

% primes
stop = false;
while ~stop
p = generatePrime(plength);
q = generatePrime(qlength);
    if gcd(p,q)==1
        stop = true;
    end
end
    assert(gcd(p,q)==1,'P and Q are not co-prime')

% Euler totient
n = q*p;
totient = (p-1)*(q-1);

% keys
stop = false;
while ~stop
%     s = 65537;              % value must be coprime with totient (default=65537)
    s = generatePrime(keylength, totient);
        assert(gcd(s,totient)==1, 'Public key s and the totient are not coprime');
    
    h = inverseMod(double(totient),double(s)); 
    if (gcd(h,totient)==1) && (s*h==mod((s*h),totient))
        stop = true;
    end
end
    assert(gcd(h,totient)==1, 'Private key h and the totient are not coprime');
    assert(s*h==mod((s*h),totient),'s*h not equal to s*h mod totient');
% output
disp(['p is ', num2str(dec2hex(p)), ' (', num2str(length(dec2bin(p))), '-bit)'])
disp(['q is ', num2str(dec2hex(q)), ' (', num2str(length(dec2bin(q))), '-bit)'])
disp(['n is ', num2str(dec2hex(n))])
disp(['Phi(n) is ', num2str(dec2hex((totient)))])
disp(['public key s is  ', num2str(dec2hex(s)),...
    ' (', num2str(length(dec2bin(s))), '-bit)'])
disp(['private key h is ', num2str(dec2hex(h)),...
    ' (', num2str(length(dec2bin(h))), '-bit)'])