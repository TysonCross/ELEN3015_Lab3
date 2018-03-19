% ELEN3015 Lab3 Test encryption/decryption with char strings
% Tyson Cross 1239448

clc
clear all

p = 157;
q = 211;
n = p*q;
totient = 32760;
s = 2179;
h = 8299;
bitsize = 32;

message = 'It is I, the Great and Powerful Oz';

% encrypt
tic;
for i=1:length(message)
    c(i) = moduloExponentiation(message(i),s,n);
end
time_encrypt = toc;


% decrypt
tic;
for i=1:length(c)
    m(i) = moduloExponentiation(c(i),h,n);
end
time_decrypt = toc;

str = {'Original';'Cipher';'Decrypt'};
fprintf('% -10s -> % -10s -> % -10s\n', str{:});
fprintf('-------------------------------------\n')
for i=1:(min(length(c),length(m)))
fprintf('% -10s -> % -10d -> % -10s\n', char(message(i)), c(i), char(m(i)))
end
disp(' ')

    disp(['The ', num2str(length(c)) , ' messages were encrypted in ', num2str(time_encrypt*1000), ' milliseconds'])

if isequal(message,m)
    disp(['The ', num2str(length(m)) , ' messages were successfully decrypted in ', num2str(time_decrypt*1000), ' milliseconds'])
else
    disp('Decryption failed!')
end
