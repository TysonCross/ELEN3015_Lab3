clc
clear all

max_it = 1000000;
mod_time_bin = 0;
mod_time_sq = 0;

    for i=1:max_it
    a = randi(999999999999);
    b = randi(888888888888);
    c = randi(111111111111);
    
    tic;
    x = binaryModuloExponentiation(a,b,c);
    mod_time = toc; 
    mod_time_bin = mod_time_bin + mod_time;

    tic;
    x = squareModuloExponentiation(a,b,c);
    mod_time = toc;
    mod_time_sq = mod_time_sq + mod_time;

    mod_time = 0;

    end

disp(['binaryModuloExponentiation (using binary exponentiation) calculated in average of ',...
    num2str((mod_time_bin/max_it)*1000), ' milliseconds'])
disp(['squareModuloExponentiation (using square exponentiation) calculated in average of ',...
    num2str((mod_time_sq/max_it)*1000), ' milliseconds'])
