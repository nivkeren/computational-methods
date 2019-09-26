%
% Variables and their types:
% --------------------------
%

%
% You can find the different classes with:
%
doc datatypes

%
% NUMBERS
% --------------
%
% the most common variable class for numbers is 'double'.
% this class is assigned by default when assigning a number.
%

a = double(2)

whos a

%
% A list of all the possible operations (not
% only arithmetic) can be found with:
%

doc ops

%
% There are many other strange classes, such as
% 'uint16' ("unsigned integer with 16 bits"), 
% but in general we won't care about them
% in this course, they are less usesful for our 
% purposes.
%

a = single(2)

whos a

a = uint16(2)

whos a

%
% Since a is 'unsigned', the result of the following
% will be 0.
%

a = uint16(-3)

%
% LOGICALS
% ----------------
%
% Logicals are the output of relational operator
% They take the value 1 ('true', 'yes') or 0 ('false','no')
%

a = logical(1)

whos a

%
% If you use another numerical value to define
% a logical, every value other than 0 or 1 will be
% converted to 1
%

a = logical(-5)

% 
% logicals can still be used for arithmetic, but
% the results will be 'double'.
%

b = a*2

whos b


%
% CHARACTERS and STRINGS
% ------------------------------------
%
% can be used to store letters and other 
% ASCII-code characters. If you're not familiar
% with ASCII, it is recommended to look at the 
% Wikipedia page of ASCII to understand what it's 
% all about - essentially very simple...
% 
%
% you can define characters by typing, for example:
%

a = 'c'

%
% characters are actually stored in MATLAB as 
% numbers (their place in the ASCII-code table) 
% and so can in principle be used for arithemtics. 
% The output does not make much sense, though....
%

a = '2'

a*2

a+1

%
% Which variable class is our variable and how can
% we transform them?
% --------------------------------------------------
%
%
% We already know we can see the class of a variable
% by 'whos'. But there are many specific functions
% to determine the variable class, for certain classes:
%

isnumeric(a)
islogical(b)
ischar(a)

%
% But the most generic is the function 'isa', which can
% be used for any data class
%

doc isa
isa(a,'double')
isa(a,'uint16')
isa(a,'char')

%
% A string is a sequence (array) of characters.
% We have to be careful with conversions of strings
% to numbers (in some contexts it will use the place in the
% ASCII code).
%
%
% The function str2num 'translates' a string to the number it means.
%

doc str2num
b = str2num('500')

%
% Converting from number to a corresponding ASCII 
% string can be made using the function num2str
%
doc num2str
c = num2str(399)
whos c

%
% A string which doesn't mean a number will simply be 'transformed'
% to an empty array
%

str2num('abc')
d = str2num('abc')

%%
% you can find information about the relational 
% operators with:
%

doc relop

%
% Some examples:
%

b = 4

a = 2

c = (a == b) % 'Equals' (asks the question whether a and b are equal)
c = (a~=b)   % 'Not Equals'
c = (a<b)    % 'Less Than'
c = (a<=b)   % 'Less or Equals to'
c = (a>b)    % 'Greater Than'

whos c

% 
% Between logicals we can do 'logical operations' 
%
a = 1
b = 0

c = a & b    % 'And'
c = a | b    % 'Or'

%
% Matrices and arrays
% --------------------------------
%
% Variables that have many elements can be stored as arrays
% The most common form of arrays (that MATLAB is specialised for) are
% matrices. These can be defined by square brackets - [], with 
% whitespaces or commas indicating columns, and semi-colon (;) indicating 
% next row
%

a = [1 2 3 4]

a = [1 2 ; 3 4]

%
% The size of the matrix can be found using the function 'size'
%

size(a)
length(a)

%
% 'size' outputs a vector - where the first element is the number
% of rows and the second is the number of columns
%

size(a,1)
size(a,2)
b = size(a)

%
% For example, we can assign 'matrix_rows' and 'matrix_columns'
% with the relevant numbers of rows and columns:
%
matrix_rows = b(1)
matrix_columns = b(2)

%
% The elements of a matrix are indexed by row and column numbers
% inside parentheses
%

a(1,1)

a(2,2)

%
% The last element (in a column or row) can be indexed by 'end'
%

a(2,end)
a(end,1)
a(end-1,1)


%
% Whole rows or columns can be indexed by colons (:)
%

b = a(1,:)
b = a(:,1)

%
% if non-existing matrices are indexed, they are created and all
% non-defined elements set to 0
%

d(5,10) = 1;

%
% Matrices can only contain one class of variables
% and mixing them may lead to strange results
%

b = [1 '2' ; 3 4]

%
% Matrices are the prime variable class for arithmetic operations.
% The rules of matrix algebra from linear algebra lessons are 
% implemented in MATLAB, for example, scalars can be multiplied/added 
% etc. with all elements of a matrix at once
%

a = [1 2 ;3 4; 5 6]
2*a
a+100

%
% in the case of two matrices there are special operators for matrix 
% or element-wise operations
%

a = [1 2;3 4]
b = [7 8 ; 9 10]

a*b  % Matrix product
b*a  % (Matrix product is not commutative...)
a.*b % Element-by-element multiplication
a.^b % Element-by-element power
	
%
% The usual rules of matrix algebra apply.
% Element-wise operations such as +,-,.* etc. require 
% matrices of the same size (or scalars).
% Matrix operations such as *,/ etc. require that the 
% number of columns in the left matrix equals 
% the number of rows in the right matrix (the 'inner'
% dimensions.
%

% 
% Matrices can be transposed by an apostrophe (')
% or by the function or the function 'transpose'
%

a = [1 2;3 4;5 6]
a'

%
% Matrices can be transformed in dimensions by 'reshape'. 
% For this, Matlab reads out the columns of the matrix
% in descending order.
%

doc reshape

reshape(a,2,3)

%
% Vectors are actually matrices whose one of the two dimensions
% is one
% 
%
% This is a row vector
%

a = [1 2 3 4]

size(a)

%
% We can transpose it to get a column vector
%

a = [1 2 3 4]'

%
% or use the semicolon
%

a = [1; 2; 3; 4]

%
% There are some built-in functions that operate
% along the first dimension ('columns').
% If the input is a vector, either row or column,
% the functions operate along the non-trivial dimension.
%

doc sum
sum([1 2 3 4])
sum([1 2 3 4]')

a = [1 2 3 4]
sum(a)

a = [1 2;3 4;5 6]
sum(a)
sum(a,2)
%
% 'cumsum' calculates the 'cumulative sum'
%

doc cumsum
cumsum(a)

%
% 'diff' calculates the difference between successive 
% elements in the columns (or the vector)
%

diff([1 2 3 4])

diff([4 3 0 4])

%
% 'min' and 'max' calculate the minimum and maximum value in each column
% (or the vector).
%

min([4 3 0 4])

min(a)

%
% The minimum of a whole 2D matrix can be calculated using a double
% application of 'min'.
%

min(min(a))

%
% ... or using 'reshape' to convert the matrix to a vector.
%

min(reshape(a,1,6))

%
% Converting the matrix to a vector can also be performed by
% using the colon - ':':
%

a(:)

min(a(:))

a=[5,6,1,2,3,4]
min(a)
[minValue, idx] = min(a(:))

% sort and find
a>3
a(a>3)
find(a>3)


%
% A colon (:) can be used to create a vector with an 
% arithmetic sequence:
%

5:20

%
% From 5 to 20 in jumps of 2
%

5:2:20

%
% The jump can be negative (a descending sequence)
%

5:-2:1

%
% From 4 to a million in jumps of 4
%
v = 4:4:1e6;

%
% This shows us the numbers in v in positions 2, 6, 12 and 50:
%

v([2 6 12 50])

%
% This shows us the first 10 numbers in v
%

v(1:10)

%
% The jump doesn't have to be an integer
%

u = 0:pi:200;

%% second part
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

