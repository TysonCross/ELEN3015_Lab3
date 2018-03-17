clc
clear all

% Primality test
n = [1:2:2^16];
count = 0;
% progressbar;

for i=1:length(n)
    matlab_prime_check = isprime(n(i));
    my_prime_check = RabinMiller(n(i));
    if matlab_prime_check~=my_prime_check
        count = count +1;
    end
%     progressbar(i/length(n));
end

agreement_rate = (1-(count/length(n)))*100;
disp(['There was ' num2str(agreement_rate),...
    '% agreement of primality for all odd integers between ',...
    num2str(n(1)),' and ', num2str(n(end))])