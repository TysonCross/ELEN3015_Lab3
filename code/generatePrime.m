function [ prime ] = generatePrime(  bit_length, target )
% generatePrime generates an odd number liklely to be prime, and the tests
% its primality using the Rabin-Miller test

    disp('Generating prime...')

    k = bit_length;
    p = target;
    for t = 1:ceil(abs(log2(p)/2))
        for M=3:floor(2*sqrt(k-1)-1)
            sum1 = 0;
            sum2 = 0;
            for m=3:M
                sum1 = sum1 + (2^m-(m-1)*t);
                for j=2:m
                    sum2 = sum2 + 1/(2^(j+(k-1)/j));
                end
            end
            a = 2.0074*log(2)*k*2^(-k);
            b = 2^(k-2-(M*t)) + ((8*(pi^2 -6))/3)*2^(k-2)*sum1*sum2;
            probability = a*b;
            if probability <= target
                prime = t;return
            end
        end
    end
%     n = abs(makeInt(n));
%     if n < 2^31
%         possible_prime =  n^2 + n + 41;         % Euler prime
%     else
%         possible_prime = n;
%     end
% 
%     while ~isProbablyPrime(possible_prime)
%         if isProbablyPrime(possible_prime)
%             prime = possible_prime; return
%         end
%         possible_prime = possible_prime + 2;
%     end
%     
%     prime = possible_prime;
end

