function [ primes ] = sievePrimes( limit )
% sievePrimes() is an implementation of the Sieve of Eratosthenes
% Iteratively marks composites as 0, then copies all remaining (unmarked) primes to a new array

% ELEN3015 Lab3
% Tyson Cross 1239448

    number_range = 2:limit;
    assert(length(number_range)>2, 'Range length must be greater than 2')

    n = 1;
        
    while n.^2 < limit
        number_range(n^2:n:limit) = 0;
        n = find(number_range>n, 1);
    end
    
    primes = number_range(number_range>1);
end

