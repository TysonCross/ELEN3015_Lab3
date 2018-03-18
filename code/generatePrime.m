function [ prime ] = generatePrime( bitsize , coprime )
% generatePrime generates an odd number likely to be prime
% and then tests this number's primality using the Rabin-Miller test

    if nargin < 2
        coprime = 1;
    end
    
    if bitsize <3
        error('Bitsize must be > 3')
    end

    start = bitsize-1;
    range = [2^start,(2^bitsize)-3] % -1 to make sure range sieveing primes has >2 entries
    r = randi(range)+2;             % +2 to make sure range sieveing primes has >2 entries

    % precomputed table of primes
%     prime_table = [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71];

    found_prime=false;
    while ~found_prime
%         if r>prime_table(end)
            % Sieving for extra primes
            % syntax is: sievePrimes(end,<start>)
            prime_table = sievePrimes( r, 2^start );
%         end

        i=length(prime_table);
        stop = false;
        while (i>1) && (~stop)
            if RabinMiller(prime_table(i),100) && (GCD(prime_table(i),coprime)==1)
                prime = prime_table(i)
                found_prime = true;
                stop = true;
            end
            i=i-1;
        end
        if ~found_prime
            r = randi(range)+2;
        end
    end
    assert(isprime(prime)==true,'RabinMiller false positive')
    assert(length(dec2bin(prime))<=bitsize,'Incorrect bitsize')
end