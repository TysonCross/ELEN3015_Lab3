% ELEN3015 Lab3 Exercise 1
clc
clear all

% keylengths
keylength = 12;                     % should be larger than (p-1), and (q-1)
plength = 8;
qlength = 8;

% primes
stop = false;
while ~stop
p = generatePrime(plength);
q = generatePrime(qlength);
    if gcd(p,q)==1
        stop = true;
    end
end
%     assert(gcd(p,q)==1,'P and Q are not co-prime')

% Euler totient
n = q*p;
totient = (p-1)*(q-1);

% keys
stop = false;
while ~stop
    s = generatePrime(keylength, totient); % value must be coprime with totient (default=65537)
        assert(gcd(s,totient)==1, 'Public key s and the totient are not coprime');
    
    h = inverseMod(s,totient); 

    
    if (gcd(h,totient)==1) && (1==mod((s*h),totient))
        stop = true;
    end
end
%     assert(gcd(h,totient)==1, 'Private key h and the totient are not coprime');
%     assert(s*h==mod((s*h),totient),'s*h not equal to s*h mod totient');

% output
disp(['p = ', num2str(p), ', hex = ', num2str(dec2hex(p)),...
    '  [', num2str(length(dec2bin(p))), '-bit]'])

disp(['q = ', num2str(q), ', hex = ',  num2str(dec2hex(q)),...
    ' [', num2str(length(dec2bin(q))), '-bit]'])

disp(['n = ', num2str(n), ', hex = ', num2str(dec2hex(n)), ')'])

disp(['The totient Phi(n) = ', num2str(totient), ' (',...
    num2str(dec2hex((totient))), ')'])

disp(['public key s = ', num2str(s), ', hex = ', num2str(dec2hex(s)),...
    ' [', num2str(length(dec2bin(s))), '-bit]'])

disp(['private key h = ', num2str(h), ', hex = ', num2str(dec2hex(h)),...
    ' [', num2str(length(dec2bin(h))), '-bit]'])
