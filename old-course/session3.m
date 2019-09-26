%% Matrices and arrays (second part)

% There are built-in fucntions that build specific kinds
% of matrices
% 
%
% Unity matrix
%

eye(5)
I = eye(5)
eye(20)

%
% All-zero matrix
%

zeros(5)
zeros(2,3)

%
% All ones matrix
%

ones(3,2)
ones(3)

%
% If we want to fill a matrix with a constant
% number we can either use 'zeros' or 'ones':
%

zeros(5,8)+2
ones(5,8)*2

%
% Diagonal matrix (put the input vector as a
% the diagonal of a diagonal matrix)
%

diag([1 3 5 7 9])
A = diag([1 3 5 7 9])


%
% 'horizontal concatenation':
%

a = [1 2 3;2 4 6]
b = [1 2 3;4 5 6]

horzcat(a,b)
vertcat(a,b)

%
% Instead of the function horzcat we can simply
% write:
%

[a b]

%
% And instead of the function vertcat we'll use [ ] and 
% the semicolon ';'
%

[a; b]

%
% We can build a 'block diagonal' matrix from
% any given matrices
% 

doc blkdiag
blkdiag(a,b)
blkdiag(a,b,a,b)

%
% horizontal concatenation of strings is easy
% to understand
%

horzcat('hello','out','there')

%
% But vertical concatenation is a problem if the
% string lengths don't match. Thus, this won't work:
%

vertcat('hello','out','there')

%
% The function 'strvcat' takes care of the problem
% By introducing blanks wherever needed to take care
% of the dimensions
%

doc strvcat
strvcat('hello','out','there')

%
% Matrices can have more than two dimensions
%

%
% For example a 'cube' of dimension 3:
%
A = zeros(3,3,3)

%
% Here we fill the first 'layer'
%

A(:,:,1) = [1 2 3;4 5 6;7 8 9]

%
% The second 'layer'
%

A(:,:,2) = [1 2 3;4 5 6;7 8 9]+9

%
% The third 'layer':
%
A(:,:,3) = [1 2 3;4 5 6;7 8 9]+18

%
% CELL ARRAYS
% cell arrays are useful for storing different types of variables in
% one array.  The price you pay for this is that cell arrays are difficult
% to manipulate and can sometimes be very confusing
%

%
% you can define a cell array by
%

a = cell(4,3)

%
% or by indexing with curly brackets (={})
%

a{2,3} = 'shay'

a{1,2} = 2

%
% This is another from of indexing a cell array:
%

a(3,2) = {6}

%
% you can even put a whole matrix in one cell:
%

a{3,1} = [1 2;3 4]

%
% If a cell contains a numeric type variable
% you first have to 'take it out' before you can
% manipulate it mathematically.
%

a{3,1}*5

%
% you can transform matrices to cells by 'mat2cell'
%

doc mat2cell
x = ones(60,50)
mat2cell(x,[10 20 30],[25 25])
mat2cell(x,ones(1,60),ones(1,50))

%
% STRUCTURES
% Structures allow the user to save and access many different 
% variables as 'fields' with given names.
%

%
% structures can be defined with the function 'struct'
%

doc struct
s = struct('name','shay','date','2211','height',1.79)

%
% or by indexing the fields:
%

s.name = 'amit'

%
% We can create arrays of structures
%

s(10) = struct('name','shay','date','2211','height',1.79)

s(10)
s(1)
s(2)

clear

%
% You can initialize a structure with all fields empty,
% a 'skeleton' structure
% 

s = struct('name',[],'date',[],'height',[])

doc rmfield

%
% We can remove fields by 'rmfield'
%

rmfield(s,'date')

%
% Without substituting the result into 's' (or another
% variable), nothing changes!
%

s

s = rmfield(s,'date')

%
% FLOW CONTROL
% ---------------------
% Programs, and particulalry functions, often need to repeat the same 
% operation a number of times - a loop. There are two main ways of 
% doing this:
%

%
% A 'for' loop: 
% ------------
% for <variable name> = <vector array>
% <commands>
% end
% ------------
% In each iteration of the loop, the variable will assume
% the next value from the vector.
%

doc for

%
% simplest example: list all the squares of the numbers
% from 1 to 10
%
for a = 1:10
a^2
'---------'
end

%
% After the loop execution ends, the value in 'a' is the last value
%

%
% The values in the vector don't need to have any
% specific order
%

for a = [2 7 -4 0.2]
a^2
end

%
% while loop: 
% ------------
% while <condition>
% <commands>
% end
% ------------
% commands get executed as long as the condition is 'true'
%

doc while

x = 0;

while x<10
x = x+1
end

%
% Similarly to every other programming language,
% there's also an 'if' statement, with 'else'
% and 'elseif' options. The 'if' statement is 
% terminated by the keyword 'end', which also is 
% the ending keyword for 'for' and 'while' loops.
%

doc if

