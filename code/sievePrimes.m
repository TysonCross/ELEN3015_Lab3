function [ primes ] = sievePrimes( limit, start )
% sievePrimes() is an implementation of the Sieve of Eratosthenes
% Iteratively marks composites as 0, then copies all remaining (unmarked) primes to a new array

    if nargin < 2
        start = 1;
    end
%     progressbar; 

    number_range = start:limit;
    n = number_range(2);
    while n^2 < limit
        number_range(n^2:n:limit) = 0;
        n = find(number_range>n, 1);
%         progressbar(n^2/limit); 
    end
    primes = number_range(number_range>1);
%     progressbar(1);
end

