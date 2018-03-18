% ELEN3015 Lab3 Exercise 2

clc
clear all

% values generated in previous exercise
% p = 157, hex = 9D  [8-bit]
% q = 211, hex = D3 [8-bit]
% n = 33127, hex = 8167)
% The totient Phi(n) = 32760 (7FF8)
% public key s = 2179, hex = 883 [12-bit]
% private key h = 8299, hex = 206B [14-bit]

p = 157;
q = 211;
n = p*q;
totient = 32760;
s = 2179;
h = 8299;
bitsize = 8;

range = [2^(bitsize-1),2^bitsize-1];
numbers = [];
for i=1:1000
    numbers(i) = randi(range);
end

% encrypt numbers
tic;
c = [];
for i=1:length(numbers)
    c(i) = moduloExponentiation(numbers(i),s,n);
end
time_encrypt = toc;


% decrypt numbers
tic;
m = [];
for i=1:length(c)
    m(i) = moduloExponentiation(c(i),h,n);
end
time_decrypt = toc;

str = {'Original';'Cipher';'Decrypt'};
fprintf('% -10s -> % -10s -> % -10s\n', str{:});
fprintf('-------------------------------------\n')
for i=1:(min(length(c),length(m)))
fprintf('% -10d -> % -10d -> % -10d\n', numbers(i), c(i), m(i))
end
disp(' ')

    disp(['The ', num2str(length(c)) , ' messages were encrypted in ', num2str(time_encrypt*1000), ' milliseconds'])

if isequal(numbers,m)
    disp(['The ', num2str(length(m)) , ' messages were successfully decrypted in ', num2str(time_decrypt*1000), ' milliseconds'])
else
    disp('Decryption failed!')
end
