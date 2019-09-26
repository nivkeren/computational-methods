%
% COMPLEX NUMBERS
% --------------------------
%
% Matlab allows a very convenient treatment of complex numbers
%

%
% Unless defined otherwise, 'i' is the 'i' we all know from complex
% number notation - square root of -1.
%

sqrt(-1)

%
% Here you can also see the default way in which Matlab prints
% complex numbers
%

%
% This is also one way we can write complex numbers and input
% them to Matlab. Note the absence of any multiplication sign
% between the number and 'i' (it is obviously not an error to 
% write it nevertheless).
%

c1 = 1-2i

%
% Some engineers are used to a notation where 'j' replaces 'i'.
% That works also.
%

c1 = 1-2j

%
% Another way to construct a complex number is using the
% built-in function 'complex'.
%

c1 = complex(1,-2)

%
% And obviously we can use also the built-in function
% 'sqrt' (square root) to construct 'i' as sqrt(-1). But that's 
% not very convenient...
%

c1 = 1-2*sqrt(-1)

%
% All the arithmetic operations are defined on the 
% complex numbers as we expect them to be.
%

c2 = 3*(2-3i)

c3 = sqrt(-2)

c4 = (c1+c2)/c3

%
% The functions 'real' and 'imag' extract the real and
% the imaginary part of the complex number
%

c4r = real(c4)


c4i = imag(c4)

%
% For polar (Euler) representation of complex numbers we
% need the absolute value and the phase.
%
%
% The absolute value is obtained with the function 'abs'.
%

abs(c4)

%
% The phase is obtained with the function 'angle'.
% The phase is in radians betwee -pi and pi.
%

doc angle
angle(c4)

%
% The number can be easily reconstructed from the
% absolute value and the phase.
%

r = abs(c1)
phi = angle(c1)

r*exp(phi*i)

%
% We can also use the built-in function 'conj'
% to get the complex conjugate ('tzamud').
%

doc conj
c1
conj(c1)

%
% POLYNOMIALS
% --------------------
%
% Matlab has some neat built-in functions to
% perform operations on polynomials.
%

%
% Matlab represents a polynomial simply as
% a vector. The first element hold the coefficient
% of the highest power, and the last holds the coefficient
% of the zeroth power.
%

%
% This polynomial is x^4-12*x^3+25*x+116
%

p = [1 -12 0 25 116]

%
% The function 'roots' assumes the vector it got as 
% input represents a polynomial, and it returns 
% a column vector with the roots of the polynomial.
%

doc roots
roots(p)

%
% The function poly receives a column vector
% and assumes it contains all the roots of a polynomial.
% It builds a polynomial that has those roots.
%

doc poly
r = roots(p);

%
% Operations defined between polynomials
%
a = [1 2 3 4];
b = [1 4 9 16];

%
% Addition is very simply an element-by-element addition.
%

a+b

%
% Multiplication is equivalent to 'convolution',
% so the function 'conv' is used to perform it.
%

doc conv
conv(a,b)

%
% Matlab can also calculate derivatives and integrals
% of polynomials.
%

%
% Derivative
%

doc polyder
c = conv(a,b);
polyder(c)

%
% Integral. The additional argument is the integration constant. 
% If no constant is specified, the default is 0.
%

polyint(c)
polyint(c,28)

%
% The function 'polyval' evaluates a polynomial
% in specified locations.
%

doc polyval
polyval(c,1)
polyval(c,-4)
polyval(c,[1 5 9])

%
% For example, let's plot the polynomial 
% x^3+4*x^2-7*x-10 between x = -1 and x = 3.
%

p = [1 4 -7 -10];
x = linspace(-10,3,1000);
v = polyval(p,x);
plot (x,v)
grid

% 
% Using the plot we can test polynomial roots
%

roots(p)

%
% We can also examine where the derivative is zero
%

roots(polyder(p))

%
% Matlab also offers a way to fit a polynomial to data.
% By 'fit' we mean in the 'least squares' sense,
% i.e., the polynomial whose averaged sum of squared distances
% from the points is minimal.
%

x = 0:0.1:1;
y = [-.447 1.978 3.28 6.16 7.08 7.34 7.66 9.56 9.48 9.3 11.2];


%
% We use the function 'scatter' to get a 'scatter plot',
% where the points are not connected with lines and
% there are only markers in the form of empty circles.
% Obviously we can obtain the same plot using 'plot'
%

scatter (x,y)
plot (x,y,'o')

%
% To fit a polynomial to the data we use the function
% 'polyfit'.  Besides the input x and y data, we also have
% to specify the degree of the polynomial we wish to fit.
%

doc polyfit
polyfit(x,y,1)
polyfit(x,y,2)

%
% We'll plot the polynomial we fitted on the scatter
% plot.
%

xx = linspace(0,1,100);
hold

p1 = polyfit(x,y,1);
p2 = polyfit(x,y,2);
plot (xx,polyval(p1,xx),'k')
plot (xx,polyval(p2,xx),'r')


%
% Reminder: we started class with an explanation about
% Least-square fitting. The following website gives
% another introduction to the topic:
% http://mathworld.wolfram.com/LeastSquaresFitting.html
%
