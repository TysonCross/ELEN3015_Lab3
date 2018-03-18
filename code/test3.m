tic;
k = 16; % bitsize

start = k-1;
primes = [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71];
range = [2^start,2^k-1];
r = randi(range);

if r>primes(end)
    disp('Sieving for extra primes')
   primes = [ sievePrimes( r, 2^start ) ];
end

count=0;
i=length(primes);
stop = false;
while (i>1) && (~stop)
    if RabinMiller(primes(i),100)
        p = primes(i)
        pb = dec2bin(p)
        stop = true;
    end
    i = i-1;
end

%% output
primetime = toc;
disp(['(',num2str(length(primes)),...
    ' primes found between ',...
    num2str(primes(1)), ' and ',...
    num2str(r), ' in ',...
    num2str(primetime), ' seconds)'])

if count>0
    error('Sieve not working')
end

if ~isprime(p)
    error('RabinMiller not working')
end

if length(pb)~=k
    e('Incorrect bitsize')
end
