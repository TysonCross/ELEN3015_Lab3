% ELEN3015 Lab3
% Tyson Cross 1239448

clc
clear all

% Primality test
n = 2^16;                               % how many random numbers to test
range = [1,2^32-1];
count = 0;
progressbar;

for i=1:n
    r = randi(range);
    matlab_prime_check = isprime(r);
    my_prime_check = RabinMiller(r);
    if matlab_prime_check~=my_prime_check
        count = count +1;
    end
    progressbar(i/n);
end

progressbar(1);
agreement_rate = (1-(count/n))*100;
disp(['There was ' num2str(agreement_rate),...
    '% agreement of primality for the ',...
    num2str(n), ' random integers tested in range [',...
    num2str(range(1)),',', num2str(range(end)), ']'])

%% output (when n = 2^16:)
%
%   There was 95.2805% agreement of primality for the 65536 random integers tested in range [1,4294967295]
%
