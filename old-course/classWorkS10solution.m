% class work 8
% solution

% 1
 f=@(x) 1./sin(x*pi);
 
 integral(f,0.25,0.75)
 
 % or
 
 x=linspace(0.25,0.75);
 trapz(x,f(x))
 
 % 2
 f=@(x)sqrt(1-x.^2);
 x=-1:0.05:1;
 x1=-1:0.001:1;
 a=trapz(x,f(x));
 a1=trapz(x1,f(x1));
 a2=integral(f,-1,1,'abstol',1e-7);
 
 