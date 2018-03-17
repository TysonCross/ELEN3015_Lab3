function a = ouf(b)
% ouf() sets up under and overflow detection for an fixed-point integer

a = fi(b);
F = a.fimath;
% F.SumMode = 'SpecifyPrecision';
% F.ProductMode = 'SpecifyPrecision';
a.fimath = F;

P = fipref;
P.LoggingMode = 'on';

P.NumericTypeDisplay = 'none';
P.FimathDisplay = 'none';

% a.SumWordLength = 64;
% a.SumFractionLength = 0;
% a.ProductWordLength = 64;
% a.ProductFractionLength = 0;

end

