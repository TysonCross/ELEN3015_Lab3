function [ prime ] = generatePrime( bitsize , coprime )
% generatePrime generates an odd number likely to be prime
% and then tests this number's primality using the Rabin-Miller test

% ELEN3015 Lab3
% Tyson Cross 1239448

    if nargin < 2
        coprime = 1;
    end
    
    if bitsize <3
        error('Bitsize must be > 3')
    end

    start = bitsize-1;
    range = [(2^start)+1,(2^bitsize)-3];
    r = randi(range)+2;

    found_prime=false;
    while ~found_prime
            if RabinMiller(r) && (GCD(r,coprime)==1)
                prime = r;
                found_prime = true;
                stop = true;
            end
        if ~found_prime
            r = randi(range)+2;
        end
    end
    assert(isprime(prime)==true,'RabinMiller false positive')
    assert(length(dec2bin(prime))<=bitsize,'Incorrect bitsize')
end