% n = generatePrime(randi([2^31,2^32]));
n = generatePrime( 10,0.1);

if isProbablyPrime(n)
    disp([num2str(n), ' is a prime'])
end