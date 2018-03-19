% ELEN3015 Lab 3
% Tyson Cross 1239448
% Prime finding

clc 
clear all

test_limit = 10;
primetime = zeros(1,test_limit-2);
temp_time = zeros(1,num_tests-2);
range = [3:test_limit];

i=1;
for keylength=range
    generatePrime(keylength);
    primetime(i)=sum(temp_time(:))/num_tests;
    disp([num2str(keylength) ,...
        '-bit prime found in mean time of ',...
        num2str(primetime(i)*1000), ' milliseconds'])
    i = i+1;
end

stem(primetime,range);
