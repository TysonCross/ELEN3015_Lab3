%prime number generator. %This code generates prime numbers in the range
%spesified. Code was implemented to check that prime number test works to
%some degree of accuracy.
clear all
clc
max_number = 200
p=zeros(1,max_number );
count=1
for i =1:max_number 
     
    n = i
    k=0;
    m=1;
     
    if n<0
        disp('the nmber cant be negative!')
    elseif n<4 && n>1
        disp('number is prime less than 4')
        p(count)=n
        count=count+1
    elseif isinteger(n/2)==1
        disp('number is even and so not prime')
    else
        while k <=n
            if isinteger((n-1)/2^(k+1))==0 %check if the n-1 number is devisable by 2^k+1
                break
            else
                k=k+1;
                m=(n-1)/2^k;%calculate the m value
            end
        end
        k
        m
        a=ceil(rand(1)*(n-3)) %generate a random whole number between 0 and n
         
        % b0=(2^m/n-floor(2^m/n))*n
        b=mod(a^m,n)
         
        if b == 1 || b == -1
            disp('Input is prime(probaly)..')
            p(count)=n;
            count=count+1
        else
            t=0;
            for i=1:k
                b=mod(b^2,n)
                t=t+1
                if b == -1 || b + 1 == n
                    p(count)=n;
                    count=count+1
                    disp('Input is prime(probaly)!')
                     
                     
                elseif b==1
                    disp('input is not prime')
                    break
                end
            end
        end
        if p==0
            disp('input is not prime')
        end
        disp('end')
    end
end