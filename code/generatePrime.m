function [ prime ] = generatePrime( bitsize, coprime )
% generatePrime generates an odd number liklely to be prime, and the tests
% its primality using the Rabin-Miller test
if nargin < 2
    coprime = 1;
end
start = bitsize-1;
range = [2^start,2^bitsize-1];
r = randi(range);
% precomputed table of primes
prime_table = [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71];

if r>prime_table(end)
    % Sieving for extra primes
    % syntax is: sievePrimes(end,<start>)
    prime_table = sievePrimes( r, 2^start );
end

i=length(prime_table);
% stop = false;
while (i>1) %&& (~stop)
    if RabinMiller(prime_table(i)) %&& isCoPrime(coprime)
        prime = prime_table(i);
        assert(isprime(prime)==true,'RabinMiller not working')
        assert(length(dec2bin(prime))==bitsize,'Incorrect bitsize')
        return
%         stop = true;
    end
    i=i-1;
end



%% output
% disp(['(',num2str(length(primes)),...
%     ' primes found between ',...
%     num2str(primes(1)), ' and ',...
%     num2str(r), ' in ',...
%     num2str(primetime), ' seconds)'])