function [ x ] = bitlength( value )
% bitlength() returns the length in bits to represent an input value

% ELEN3015 Lab3
% Tyson Cross 1239448

x = length(dec2bin(value));
end

