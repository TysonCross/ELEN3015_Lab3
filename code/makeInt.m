function [ output ] = makeInt( input )
% makeInt checks the input to see if it is an integer.
% if not, the value is floored to the nearest int and returned

    if isnan(input)
        error('Valuew cannot be NaN')
    end
    
    if isinf(input)
        error('Value cannot be Inf')
    end
    
    if mod(input,1)==0
      	output = input;
    else
        output = floor(input);
        warning(['Using integer value of ''', num2str(output),...
            ''' in place of ''', num2str(input), ''' '])
    end

end

