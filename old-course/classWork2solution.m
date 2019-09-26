% class work 1

% use the function 'magic' to create 3x3 matrix and call it 'm' 

m=magic(3);

% use 'sum' function on 'm'. sum the rows and the columns of 'm'.
sum_m_row=sum(m,2); sum_m_columns=sum(m);
% call it 'sum_m_rows' and 'sum_m_columns'. 

% sum all the numbers in 'm'. call it sum_m_all
sum_m_all=sum(sum(m));

% multiple 'm' by 3 and add 9 to the first column of 'm'. be sure you are
% saving all changes in 'm'
m=m*3; m(:,1)=m(:,1)+9;

% cut the 2nd column of 'm'. call it 'secondColumn'
secondColumn=m(:,2);

% find the max value in 'secondColumn'. what is the index of the max value?
[maxValue,idxMax]=max(secondColumn);

% find the places (indexes) of the values in 'm' which are bigger than 20. 
find(m>20)

% create a vector with the values that are bigger than 20. call it
% 'biggerThanTwenty'
biggerThanTwenty=m(m>20);

% (*) replace the min value in 'biggerThanTwenty' with the number 1.
minValue=min(biggerThanTwenty);
biggerThanTwenty(biggerThanTwenty==minValue)=1;