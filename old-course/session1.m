
% There are numerous demos of what MATLAB can do
% for us
%

teapotdemo

vibes

%
% Command WINDOW: Everything you type is evaluated
%

%
% A scalar
%

12

%
% A vector
%

[1 2 3 4 5];

%
% Defining a variable
%

a = 5

% 
% Using a variable to calculate a new variable
% (the value is calculated and stored in the new 
% variable). The '=' sign is used to store a 
% value in a variable ("assignment").
%

b = a*5

%
% MATLAB has many numerical operators that operate on
% both matrices and scalars, see "help *"
% or "help arith", or use "doc" instead of "help",
% to get a nicer, web-like help.
%

help arith

doc arith

doc *

% 
% Addition
%

2+1

%
% Subtraction
%

a-3

%
% Division
%

b/2

%
% Logical equal (i.e. test for equality). In this case
% whether any of the vector members equals 'a'.
%

a == 5

a == [1 0 3 0 5]

%
% If 'a' itself is a vector, the test will be
% performed on the relevant coprresponding entries.
% 

a = [1 2 3 4 5]

a == [1 0 3 7 5]

%
% What's the error in this case:
%

a = [1 2 3]*[4 5 6]

%
% The problem is that '*' is either
% a scalar multiplication or a matrix
% multiplication. Multiplying two 
% row vectors can't be done using '*'
% We can learn all that in the 'doc'
% of 'arith' - the help file about
% arithmetic operations.
%

doc arith

%
% So, in order to perform an element-by-element
% multiplication, we have to use '.*'
%

a = [1 2 3].*[4 5 6]

%
% We clear the command window (not delete the
% workspave variables), using the command 'clc'
%

clc

%
% Workspace and array editor
% --------------------------
%

whos

% 
% (Or by examining the 'workspace' window in
% the MATLAB desktop)
%

%
% We can see the details of one specific variable by:
%

whos a

%
% There is also the array editor which you can invoke
% by clicking on the desired variable in the workspace
% window.
%

%
% The following command creates a 100x100 random matrix,
% using the function 'rand' which we will learn in
% due course.
%

c = rand(100)

%
% We can delete a variable from the workspace by the
% command 'clear'
%

clear a b

%
% We can save variables for later use by the
% 'save' command. The following commands save 
% a file called random_nums.mat in the current
% directory. '.mat' is the default suffix for 
% data files created by MATLAB. Even though we
% define another variable 'b', it will save
% only the variables we ask it to save.
%

doc save

a = rand(100)
b = 15

save random_nums a

%
% We can also save all variables in the whole
% workspace by adding no arguments to the 'save'
% command. The default name of the file that
% it creates is 'matlab.mat'.
%

save

%
% .mat files are loaded by the 'load' command.
% To demonstrate it we first clear all the workspace.
%

clear
load

clear
load random_nums

%
% Editor: creates .m files, which contain executable code
% 
% We run scripts by the command 'run' or simply the
% name of the script, even without the '.m'
%
 
% 
% In the editor you can write in the file whatever commands
% you wish, and running it later will execute them.
%

edit script1.m
clear

run script1

script1

doc path

%
% The 'path' function without arguments displays the
% execution search path. That means where matlab will
% look for the script, if it resides in many directories,
% Matlab will run the version in the directory closest
% to the top of the search path.
%

doc path
path

%
% A convenient way to manipulate the path:
%

pathtool

path

%
% Functions:
% ----------
% Scripts that take inputs and use them to calculate outputs.
% Functions have the first line:
% function[output1,output2,...] = function_name(input1,input2)
% Functions often have a 'help', that consists of the
% comment lines immediately after the first line.
% Functions stop being executed at the command 'return',
% but return can be omitted if the function ends at the end
% of its file.
%

doc function

edit mymath.m

 [A,S,M,D] = mymath(3,4)
[aa,ss,mm,dd] = mymath(5,6);
[aa,ss,mm,dd] = mymath(a,b);

help mymath

% 
% We can use variables as inputs (but we have to
% make sure they're already defined). Also, note
% that the names of the inputs or outputs don't 
% have to be related to their names inside the
% function.
%

% 
% MATLAB includes many built-in functions and even variables
%

pi
sin(pi)
sin(0)

%
% By the way, trigonometric function expect the value to be in radians,
% but if you add 'd' to their name, they expect it to be in degrees.

sind(180)

sin(pi/2)

sqrt(4)

sqrt(2)

%
% Let's write a more interesting function, with plots
% and vectors and stuff...
%

edit mytrig.m

%
% The following line defines a vector whose values
% start from 0, and go all the way to 2*pi, in jumps
% of 0.01:
%

x = 0:0.01:2*pi;

%
% Look at the function mytrig to see what
% it does.
%

mytrig(x)

