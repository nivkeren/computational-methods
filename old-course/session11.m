%
% Some more specialized graphics
% ==========================
%

%
% Pie chart : The function 'pie' draws a 'pie chart'
% of the given vector. An optional additional vector 
% variable tells which 'slices' are to be 'taken out' 
% of the pie.
% 

doc pie

v = [.5 1 1.6 1.2 .8 2.1]
pie (v)

takeout = [0 1 1 0 0 0];
pie(v,takeout)

%
% pie3 draws a better-looking 3-dimensional pie chart.
%

pie3(v,takeout)

%
% Bar chart: bar (or bar3 - for a 3-d look), drawS
% bar charts of the given vector (same input sequence
% as 'plot').
%

doc bar
x = -2.9:0.2:2.9;
y = exp(-x.^2);
plot (x,y)
bar (x,y)
bar3 (x,y)

%
% barh - draws a horizontal bar chart
%

barh (x,y)

%
% The function 'histogram' is more than a simple graphic
% function. It draws a histogram of the given vector.
% For that it has to count the number of elements in
% each bin.
%

doc histogram

%
% An example: random 5000 (or 50000, or 500000) numbers 
% drawn from a Gaussian distribution of zero mean and 
% unit standard deviation.
%

doc randn
y = randn(5000,1);
histogram(y)
y = randn(500000,1);
histogram(y)

clf

%
% Besides plotting, the function also can return as output 
% a structure containing all the information regarding the counts.
%

X = histogram(y)

%
% If we supply an additional scalar numerical argument,
% it tells 'histogram' how mamy bins are required to be
% in the histogram.
%

histogram(y,10)
histogram(y,100)

%
% We can also tell hist the location of the (left edges 
% of the) bins we want. Otherwise, the default is division 
% of the range of the input vector to 10 bins.
%

histogram(y,-5:0.25:4.75)

%
% Drawing a plot with vertical error bars is achieved
% with the 'errorbar' function.
%

doc errorbar

x = linspace(0,2,21);
y = sqrt(x);
err = y/10;
errorbar(x,y,err)
errorbar(x,y,err,'.')
errorbar(x,y,err,'o')
errorbar(x,y,err,'o--r')

%
% Plotting polar coordinates is achieved with the function
% 'polarplot',  which accepts as input the angle and the size of
% the vector we wish to visualize.
%

doc polarplot
t = linspace(0,2*pi);
r = sin(4*t)+1;
polarplot(t,r)
plot(t,r)
%
% Matlab functions related to time manipulation
% ======================================
%

%
% The function 'clock' outputs a 6-element vector
% of numbers containing the time as:
% year, month, day, hours, minutes,second
%

doc clock
clock
clock
c = clock;
c

%
% It's best to see it using the format 'short g',
% which chooses the best between 'double'
% and 'integer' representation
%

format shortG
c

%
% The function 'now' outputs the time as a single
% number, that counts the days from '0/0/0'.
%

doc now
now

%
% The function datestr converts the date number
% (output of 'now') to a string, according to a list
% of formats (the second parameter), that you can
% find in the documentation. We show here several
% examples.
%

doc datestr
datestr(now)
datestr(now,'dd-mmm')
datestr(now,'dd-mm')
datestr(now,'HH:MM dd-mmm')

%
% The function for the reverse operation
% (string to numbers) is 'datenum'
% 

doc datenum
datenum('17-Sep-1917 10:45')
then = datenum('17-Sep-1917 10:45')
now-then

%
% The function 'datevec' converts a date number 
% to a date vector (like the output of 'clock')
%

doc datevec
datevec(now)
format shortG
datevec(now)

%
% The function 'datetime' converts a date number 
% to a date vector (like the output of 'clock')
%
doc datetime
datetime('yesterday')
datetime('now')
datetime('1-Jan-2019 12:45:07')
datetime([2019 1 1 12 45 07])
datetime(2019,1,1)
datetime('now','TimeZone','Asia/Seoul','Format','d-MMM-y HH:mm:ss Z')

%
% The function 'weekday' output the day of the
% week for any date (a number or a string!)
%

doc weekday
weekday(now)

%
% With two output arguments it also gives the
% string of the weekday name.
%

[n,s] = weekday(now)

%
% The function 'eomday' outputs the number of days
% in the given month (year and month)
%

doc eomday
eomday(2017,1)
eomday(2017,2)
eomday(2016,2)

%
% The function 'calendar' produces a calendar of the given month.
% (as a simple matrix)
%

doc calendar
calendar
mat = calendar;
mat
calendar(2019,1)

%
% The functions 'tic' and 'toc' can be used to measure
% the time elapsing - used for testing the performance
% of codes we write- they act as a stopwatch.
%

doc tic
tic;plot(rand(50,5));toc
tic;plot(rand(50,5));toc
tic;plot(rand(50,5));toc
tic;plot(rand(50,5));toc
tic;plot(rand(50,5));toc
tic;plot(rand(50,5));toc

%
% While tic and toc measure the elapsed time in the real world,
% 'cputime' measures only the time spent in the cpu.
%

doc cputime
t = cputime;plot(rand(50,5));cputime-t
t = cputime;plot(rand(50,5));cputime-t
t = cputime;plot(rand(50,5));cputime-t
t = cputime;plot(rand(50,5));cputime-t

%
% Matlab's profiler can help us examine the time it takes
% to every piece of our code to run - a very powerful tool
% to optimize performance
%
doc profile

profile on

for ii = 1:1000
convert_cm(ii,'inch');
end

profile viewer



