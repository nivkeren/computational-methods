% OUTPUT TO FILE
%
%
% The command 'save' without any parameters
% saves all the workspace to the file 'matlab.mat'
% It saves data in a format that only matlab can read
%

a = [1 1 1 1];
b = [2;2;2];
save

doc save

%
% If we give 'save' a parameter, it will use it
% as a file name, only after adding to it '.mat'.
%

save rega

%
% More parameters given to the command tells
% it which variables to save from the workspace
%

save rega a

%
% There are some more subtleties, like usage of
% 'wildcard' (*)
%

a1 = [2 3];
a2 = 'sdfsdf';
save rega a*

%
% Many matlab commands have 'command-function' duality,
% that is, they can be called not only as commands, but also
% as functions, where all the arguments are given as strings,
% between parentheses.
%

save('rega','a')
save('rega','a*')

%
% You can't save variables that are not defined
%

save rega c

clear

%
% In order to read '.mat' files we use the command 'load'
%

load

clear
load rega

clear

%
% If we want, we can read only part of the variables stored
% in the .mat file, and also use the 'wildcard' option.
%

load rega a1

%
% We can also read ASCII files, as long as
% they contain numeric data. If the data have the shape
% of a matrix, MATLAB will identify it, and create
% a variable with the name of the file to store the
% data.
% ------------------
%

%
% To demonstrate it we created the file 'a.txt' (attached),
% which contains an ASCII representation of a 2x3 matrix
%
%
% We can use the 'type' command simply to show us the 
% contents of ASCII files
%

type a.txt

%
% Here we load the ASCII file with the 'load' command.
% If the contents of the file are numeric, and organized 
% as a matrix, Matlab reads it and prepares a variable 
% whose name is the same as the name of the file 
% (beore the suffix '.txt').
%

load a.txt

a

%
% If we want the data to be put into another variable,
% we can use the load command in its 'function' form
% and simply substitute the output of the function into
% the new variable:
%

b = load('a.txt')

clear

%
% The command 'whos' can also be applied to .mat files
% to tell us about the contents of the file
%

whos
whos -file matlab
whos -file rega

% 
% For specific file formats MATLAB has specific functions
% that can read and write them
%

doc dlmread
doc xlsread
doc imread

%
% MATLAB can also perform 'low-level file I/O'.
% Before doing so a file has to be 'opened', using
% the function 'fopen'. You have to say to fopen 
% whether the file is intended to be read, written, 
% or some other options. The function gives a 'file id' 
% value, which we usually store in a variable, and in 
% every low-level I/O operation we have to specify this 
% 'file id'
%

doc fopen

%
% The useful function is fscanf, which reads an ASCII
% file, using a specified conversion format. The details are
% very similar to the details of the fscanf function in C/C++.
%
% The corresponding function for printing is 'fprintf'
%

doc fscanf
doc fprintf

%`
% We have to remember to close files that we opened,
% using the 'fclose' function.
%

doc fclose

%
% An example for the use of fprintf
%

x = 0:0.1:1

%
% We creat the matrix 'y', where the first line is
% the 'x' values, the second line is their exponents.
%

y = [x;exp(x)]

%
% Open the file for writing, associating it with 
% the variable 'fid'. Remember, the actual value
% of fid is of no importance!
%

fid = fopen('exp.txt','w')

%
% Details about the format string are in the
% documentation of fprintf,
%

doc fprintf

fprintf(fid,'%06.2f %12.8f\n',y);

%
% And we remember to close the file...
%

fclose(fid)

%
% Let's see whether the file we created really
% contains what we meant:
%

type exp.txt

%
% The command 'sprintf', which 'prints' into a string
% can be useful, for example, when we want to manipulate 
% a string that contains 'running numbers'
%

doc sprintf

%
% An example:
%

for i = 1:10
sprintf('yarin %d',i)
end

%
% Instead of the 'sprintf' mechanism we could have
% used 'horizontal concatenation' but it would be
% a little more cumbersome
%

for i = 1:10
['yarin ' num2str(i)]
end

%
% We can control the way MATLAB displays our calculations
% by the command 'format'
%

doc format

%
% 'format compact' skips the blank lines we are used
% to see in matlab.
%

format compact
format loose
%
% So now the loop we performed earlier will have
% a much more compact output:
%

for i = 1:10
sprintf('yarin %d',i)
end

%
% 'format long' displays every number with many decimal digits
%

format long

pi

%
% The default is usually 'format short', with 4 decimal digits
%

format short

pi

%
% The command 'eval' gets a string and simply treats it as
% a matlab command. Usually it's considered bad practice
% to use eval, but sometimes it's still the best way.
%

doc eval

aMatrix = magic(5);

expression = input('Enter the name of a matrix: ','s');
if (exist(expression,'var'))
    mesh(eval(expression))
end

doc mesh
