%
% Many of the examples now will use the 'humps' function
%

doc humps
clf
X = 0:.05:1;
[X Y] = humps(X);

plot(X,Y)

%
% Sometimes we need to pass functions as arguments to other
% functions. For that we need a way to treat functions as
% variables.
%

doc funfun

%
% An example of a 'functions function' is fzero:
% Let's find roots of a one-dimensional equation
% (not necessarily polynomial, which we can
% solve using the function 'roots')
%
% In order to solve the equation we will use the
% function 'fzero'
%

doc fzero

%
% 'fzero' needs an initial guess. Suppose we know
% that a root exists near x=1.3 .
%
%
% We need to give the function humps as an input
% variable to fzero. The way to do it is using
% a 'function handle'. A function handle is
% created by prefixing the function name with
% the sign '@'.
%

x = fzero(@humps,1.3)

%
% We can also experiment with other initial guesses.
%
x = fzero(@humps,10.5)

%
% An initial guess of 0.6 will produce another 
% root of the function.
%
x = fzero(@humps,0.6)

x = fzero(@humps,0.)

%
% Instead of an initial guess we can give 
% a lower and upper bound on the solution
% ('bracket the solution').
%

x = fzero(@humps,[1 1.5])

%
% Anonymous functions: if the function can be written
% in one line we can define it as an anonymous function:
%
%
% In the parentheses after the '@' we define the 
% input variables, and afterwards the function
% itself (in one line).
%
% This is exactly the expression used in humps
% (two maxima close to 0.3 and close to 0.9,
% and values decreasing to -6 on both sides).
%
af_humps = @(x) 1./((x-0.3).^2+0.01)+1./((x-0.9).^2+0.04)-6

x = fzero(af_humps,[1 1.5])

%
% ezplot is a function that gets a function as variable
% and plots it - we don't need to calculate ourselves
% a vector with all the values (not always it's the
% best way to plot a function, but it's easy).
%

ezplot(af_humps,[-1 2])

%
% The definition of an anonymous function can make
% use of all the variables defined in the workspace,
% but it only uses their value at the time of definiton!!
% If they afterwards change, the value in the function
% definition is not modified!
%
%
% TO demonstrate that let's replace the value 0.3 in the
% definition by 'a', that will first have the
% same value.
%

a = 0.3;
af_humps = @(x) 1./((x-a).^2+0.01)+1./((x-0.9).^2+0.04)-6

%
% If we clear 'a', af_humps will still work, since it used
% the value that 'a' had at the definition of af_humps.
%

clear a
af_humps(1)


%
% Changing the value of 'a' also has no effect, as expected.
%
a = 11.5;
af_humps(1)


af_humps = @(x) 1./((x-a).^2+0.01)+1./((x-0.9).^2+0.04)-6

af_humps(1)
clear a
%
% Sometimes we might need the function 'feval' for that.
% This is the most trivial example of treating a 
% function as an argument to pass to other functions.
%

doc feval

%
% We can simply use the function name and pass it to
% 'feval' (works both for built-in functions and for 
% M-file functions)
%

af_humps([-1 0 1])
feval(af_humps,[-1 0 1])

%
% We can define cell arrays of function handles:
%

fhan = {af_humps @sin @cos}

fhan{1}(5)
fhan{2}(pi)

for ii = 1:3
   feval(fhan{ii},5)
end

%
% The function 'functions' provides us with
% information about the function handle it 
% received as an argument.
% 

functions(fhan{1})
functions(fhan{2})
doc functions

%
% Let's get back to fzero:
% The function fzero is part of the 'optimization'
% toolbox. A toolbox is a 'package' of functions.
% The optimization toolbox is provided as part
% of the standard distribution of Matlab.
%
% We can control the way optimization functions work
% by an 'options' structure we pass as an input argument.
% We can use the function 'optimset' to create this structure.
%
% The input arguments to 'optimset' are pairs of control option
% (given as a string) and value.
%
% The control option 'display' controls the level of the printed
% output. 'iter' means an output at every iteration of the 
% solution algorithm.
%

doc optim
opt = optimset('display','iter');
x = fzero(af_humps,[1 1.5],opt)

%
% We can obviously transfer the result of 'optimset'
% directly to fzero, without defining the structure
% 'opt' in our workspace.
% 
x = fzero(af_humps,[1 1.5],optimset('display','iter'))

%
% Other optional values for 'display':
% 
x = fzero(af_humps,[1 1.5],optimset('display','notify'))
x = fzero(af_humps,[1 1.5],optimset('display','off'))
x = fzero(af_humps,[1 1.5],optimset('display','final'));

%
% We can modify several control options.
% 'tolx' is the tolerance on x - in the solution algorithm,
% when x changes by less than 'tolx', the function stops.
%
x = fzero(af_humps,[1 1.5],optimset('tolx',1e-5,'displ','iter'));

%
% One dimensional optimization. 
% --------------------------------------------------
%
% The function 'fminbnd' finds the minimum
% value of a one-dimensional function.
%

doc fminbnd 
ezplot(@humps,[-1 2])

%
% The function needs two bracketing values
%
[xmin,value] = fminbnd(@humps,0.5,0.8)
[xmin,value] = fminbnd(@humps,0.7,0.8)

%
% The same mechanism for passing control options is used
%

[xmin,value] = fminbnd(@humps,0.7,0.8,optimset('tolfun',1e-3))
[xmin,value] = fminbnd(@humps,0.5,0.8,optimset('tolfun',1e-3))
[xmin,value] = fminbnd(@humps,0.5,0.8,optimset('tolfun',1e-1))


%
% Multi-dimensional optimization
% -----------------------------------------------------
%
% Let's look for the minimum of the Rosenbrock's 'banana' function.
% (https://en.wikipedia.org/wiki/Rosenbrock_function)
%

%
% First let's just plot the 'banana' function.
% It's easy to see algebraically that the minimum is at the
% location (1,1).
%

[X,Y] = meshgrid(-1.5:0.125:1.5,-0.6:0.125:2.8);
Z = 100*(Y-X.^2).^2+(1-X).^2;
clf
mesh(X,Y,Z)

%
% For the minimization we will use the function 'fminsearch'
% 'fminsearch' uses the Nelder-Mead Simplex algorithm.
% (https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method)
%
doc fminsearch

%
% We have to define our function. We will define it in the
% M file 'banana.m' (attached).
%
% Besides the function name or handle, fminsearch needs also 
% an initial guess for x.
%
[xmin,value] = fminsearch(@banana,[0 0])

[xmin,value] = fminsearch(@banana,[-5 10],optimset('displ','iter'));
 