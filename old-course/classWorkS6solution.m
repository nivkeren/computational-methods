% class work 5 solution

p = [1 -2 0 0 1]

pRoots = roots(p)

% pRoots =
% 
%    1.8393 + 0.0000i
%    1.0000 + 0.0000i
%   -0.4196 + 0.6063i
%   -0.4196 - 0.6063i
% 

x = linspace(-2,2,1000);
plot(x,polyval(p,x))


pExtremum = roots(polyder(p))

% pExtremum =
% 
%          0
%          0
%     1.5000