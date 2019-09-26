% class work 2

% open:
doc if

% try the live script option to learn about 'if'


% loop over the cell array 'inputs'
% and perform a different operation each time,
% depending on the type of the contents of the cell
%
% - if it's a double, write in a new cell array: 'output' the variable*100
% - if it's a char, write the same content in 'output' 
% - if it's something else, write 'unkmnown'

% use the function 'isa'

inputs = {50,'shay',single(100)}

for i = 1:length(inputs)
if isa(inputs{i},'double')
outputs{i} = inputs{i}*100;
elseif isa(inputs{i},'char')
outputs{i} = inputs{i};
else
outputs{i} = 'unknown';
end
end
% check yourself
outputs

clear
clc
