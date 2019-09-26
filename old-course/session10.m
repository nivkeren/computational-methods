%
% Numerical differentiation in MATLAB
% ===================================
%

%
% Suppose we have scattered data, like in the 
% following example
%
x = 0:0.1:1;
y = [-0.447 1.978 3.28 6.16 7.08 7.34 7.66 9.56 9.48 9.3 11.2];

scatter(x,y)

%
% One way to estimate the derivative is 
% fitting a low-order polynomial and simply
% use the derivative of this polynomial
%

p = polyfit(x,y,2)

%
% Let's plot the fitted polynomial to see how
% good it fits the data (or not...)
%

hold
xi = linspace(0,1);
yi = polyval(p,xi);
plot(xi,yi,'--')

%
% We already learned about the function 'polyder'
% which calculated the polynomial which is the
% derivative of the input polynomial
%

dp = polyder(p)

figure
dyp = polyval(dp,xi);
plot (xi,dyp)

%
% MATLAB provides the function 'diff' which 
% allows a crude, first-order estimate of the
% derivative, by simply calculating the differences.
% Dividing the y diferrences ('delta y') by the
% x differences ('delta x'), is a first approximation
% of the derivative. It's only an approximation
% because we don't let delta x go to the zero limit,
% but simply use the value given to us.
%

doc diff
dy = diff(y)./diff(x);

%
% Let's plot this new derivative on the same graph
%

% 
% First we have to calculate the middle x between
% every two consecutive x's.
%

xmean = (x(2:end)+x(1:end-1))/2;

hold
plot (xmean,dy,'or');

%
% The plot demonstrates the fact that the
% differentiation operator amplifies noise.
% That's why the derivative estimated from the
% differences is very noisy and erratic, while 
% that estimated from the polynomial fit is
% smooth, and in general more 'well behaved'.
%

%
% For two-dimensional functions MATLAB
% provides two more differential operators.
%

%
% Let's use the 'peaks' function as an example again.
%


[x,y,z] = peaks(20);
close all
surf(x,y,z)

%
% One function is the 'gradient' function which
% calculates the two components of the gradient 
% of the two dimensional matrix defined by z.
% Again, one has to remember this is a very
% crude approximation of the gradient, but it
% improves if we have a finer resolution.
%

doc gradient
[gx,gy] = gradient(z);

%
% 'gradient' assumes that the differences 
% in x and y are constant. We can supply the function
% 'gradient' with their values.
%

hx = x(1,2)-x(1,1);
hy = y(2,1)-y(1,1);
[gx,gy] = gradient(z,hx,hy);

%
% In order to visualize it we use the function
% 'quiver' which draws arrows at each point.
%

contour(x,y,z);
colorbar()
hold
doc quiver
quiver(x,y,gx,gy);

%
% Another function is 'del2' which calculates
% the Laplacian.
%

doc del2
L = del2(z,hx,hy);
figure
surf(x,y,z,L)
colorbar()

%
% In the above demonstration we use the absolute
% value of the Laplacian to colour the surface.
%

%
% Numerical integration in MATLAB
% ===========================

%
% Let's estimate the definite integral
% of the function 'humps', between -1 and 2.
%

%
% The most crude approximation uses the
% trapezoid rule. We supply the function with
% the values of the function at some points 
% and it uses those points to calculate the
% trapezoidal summation. An explanation is 
% given in the Wikipedia page:
% https://en.wikipedia.org/wiki/Trapezoidal_rule
%

%
% Let's first use a division of the segment [-1,2]
% to intervals of length 0.17.
%

x = -1:0.17:2;
y = humps(x);
close all
plot (x,y)

%
% Now we'll use the trapezoid approximation to
% calculate the integral based on this division
%

doc trapz
area = trapz(x,y)

%
% If we use a finer division, to 100 equal intervals,
% we get a better approximation.
%

length(x)

x = linspace(-1,2);
y = humps(x);
figure
plot(x,y)
trapz(x,y)

%
% The function cumtrapz, uses the same idea to
% calculate a 'cumulative trapezoidal summation',
% which is actually an approximation to the
% indefinite integral (the operation which is
% the opposite to differentiation).
%

doc cumtrapz
F = cumtrapz(x,y);
figure
plot (x,F)

%
% In the above calculation we determined the
% division of the interval. However, if we have
% a function handle to calculate the integrand,
% we can let MATLAB decide on the optimal division
% itself.
%
%
% The function is 'integral'. We supply it with a function
% handle to the integrand, and then the two integration
% limits. The function uses the 'recursive adaptive
% Simpson quadrature' algorithm.
%


doc integral
quad(@humps,-1,2)
format long
quad(@humps,-1,2)

%
% We can supply quad with a tolerance on the value
% which says how much we want to value to be accurate.
% For example, to have an accuracy of ten decimal points:
%
quad(@humps,-1,2,1e-10)

%
% 'integral2' is used for calculating double integrals
% of two-dimensional functions.
%
%
% Let's demonstrate dblquad on the function
% sin(x)*sin(y)+1. Before writing a function for
% the integrand it's important to read the documentation
% of integral2- there are several somewhat subtle requirements 
% from such a function.
%

doc integral2

% 
%
% Pay attention to how the function looks (look also at the 
% attached file myfun.m)
%

x = linspace(0,pi);
y = linspace(-pi,pi);
[xx,yy] = meshgrid(x,y);
zz = myfun(xx,yy);
mesh(xx,yy,zz);

%
% Calculate the integral
%

volume = integral2(@myfun,0,pi,-pi,pi)

%
% Analytically it's very easy to show that
% the integral is supposed to be 2*pi^2
%

%
% There is also a function to calculate triple integrals.
%

doc integral3


%
% switch-case mechanism
% ===================
%
% The switch-case construct is a control-flow mechanism
% to switch to different code segments according to the 
% value of a variable. 
%

doc switch

%
% We demonstrate the switch-case construct in the function
% 'convert_cm' (see attached file), where we convert length
% units to centimeters according to a given keyword ('units')
%

convert_cm(10,'mm')
convert_cm(10,'m')
convert_cm(10,'inch')
convert_cm(10,'stam')

