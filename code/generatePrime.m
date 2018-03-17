function [ prime ] = generatePrime( n )
% generatePrime generates an odd number liklely to be prime, and the tests
% its primality using the Rabin-Miller test

if non_integer(n)==true
   n = floor(n); 
end
possible_prime =  n^2 + n + 41;     % Euler prime



end

