%
% GRAPHICS
%
% Now we'll deal with the most basic graphics command:
% 'plot' simply plots a function, with x and y axes.
%

doc plot

%
% First we create the x vector
%

x = 0:0.01:2*pi;


% 
% Then we create the function of x (in this case - sine)
%

y = sin(x);

%
% Now we plot
%

plot (x,y)

%
% To the basic figure we can add a title (above the figure)
%
title('Sine Wave');

%
% We can also plot two functions on the same axes. In this
% case matlab plots each one with a different colour.
%

z = cos(x);
plot (x,y,x,z)
title ('Sine and cosine waves')

% 
% If, like in the example, the two functions are based
% on the same vector of x values, we can merge them
% into a matrix.
%
%
% One of the dimensions has to agree, so matlab will
% know how to plot it. If none of the dimensions agrees, 
% it will be considered an error.
%

yz = [y;z];
plot (x,yz);

%
% By an additional argument passed to 'plot', we can
% control the appearance of the line - the colour,
% the line style (solid, dashed, dotted etc.) and
% the marker (the shape that is displayed in the 
% discrete places.
%

plot (x,y,'g')		% Green line
plot (x,y,'k')		% Black line
plot (x,y,':')		% Dotted line (blue is the default color)
plot (x,y,'--')		% Dashed line
plot (x,y,'--r')	% Red dashed line
plot (x,y,'-.m')	% Magenta dash-dotted line
plot (x,y,'m-.')	% (the order doesn't matter)

%
% Now we'll plot only the first ten values, so
% we can see that matlab actually plots the marker
% in the discrete places, and connects it with straight
% lines.
%

plot (x(1:10),y(1:10),'o')	% Circle marker
plot (x(1:10),y(1:10),'d')	% 'Diamond' marker
plot (x(1:10),y(1:10),'dr')	% Red 'diamond' marker
plot (x(1:10),y(1:10),'hk')	% Black hexagonal marker

%
% We can also use the same ideas to plot two functions
% on the same axes, as we did before
%
plot (x(1:10),y(1:10),'hk',x(1:10),z(1:10),'sg')

%
% We can add labels to the axes
%

xlabel('X axis')
ylabel('Y axis')

%
% We can add a dotted grid to the plot
%

%
% We can add text at specific points in the plot
%
plot (x,y)
text(4,0.6,'sin(x)')

%
% The 'axis' command accepts a vector with 4 elements.
% The first two are the limits of the X-axis and
% the next two are those of the Y-axis.
% 

axis([0 2*pi -1.05 1.05])

%
% If we wish to control only the Y-axis we can
% do it with the 'ylim' command that accepts two
% values only, or the 'xlim' for the X-axis
%

ylim([-1.1 1.1])

% 
% If we want to let Matlab calculate again the 
% default axis we can use 'axis', 'xlim' or 'ylim',
% depending on the case, with the input 'auto'
%

axis('auto')

%
% If we need the Y-axis to be inverted, i.e.
% have the larger values at the bottom, we can
% do it with the command 'axis ij'
%

axis ij

%
% There are more interesting options to the function 'axis'
%

doc axis

%
% We can clear the figure window by using 'clf'
% (clear figure)
%

clf

%
% Every time we use 'plot', it clears the previous
% plot and draws a new one. We can prevent it by using
% the command 'hold on', which tells Matlab to leave
% the current plot on screen when the new command is
% issued. 'hold off' turns this behaviour off.
%

plot (x,y)
plot (x,z)
plot (x,y)
hold 
plot (x,z,'g')
hold
hold

%
% 'ishold' tells us whether we're in 'hold on'
% or 'hold off' status
%

ishold

hold
ishold

%
% 'close' closes the figure window
%

close

%
% The command 'figure' opens a new figure window
% where all the new graphics command will take place
%

figure
plot (x,y)
figure
plot (x,z)

%
% In order to switch between figure windows we can
% use 'figure(num)', to switch to figure window number 'num'.
%

figure(1)
plot (x,-y)
figure(2)
plot (x,-z)

%
% 'Switching' to a figure number that doesn't exist, creates
% the new figure window
%

figure(10)

%
% We can also plot many panels in the same window, using 
% the command subplot. Subplot accepts three numbers: 
% the first and second tell matlab into how many rows and 
% columns it should divide the current figure, and the third 
% number tells on which subplot to focus now (counting
% from left to write, and from top to bottom).
%
% So we'll demonstrate by plotting four plots that
% we'll prepare now.
%
% This is a chance to introduce the function 'linspace' 
% that prepares an evenly spaced vector with specified 
% starting and ending points, and length.
%

a = sin(2*x);
b = tan(x);

%
% Note carefully the use of subplot
%

doc subplot

subplot(2,2,1)
plot (x,y)
title('sin(x)')

subplot(2,2,2)
plot (x,z)
title('cos(x)')

subplot(223)
plot (x,a)
title('sin(2x)')

subplot(224)
plot (x,b)
title('tan(x)')

%
% If we use matlab's mechanism to plot
% several plots on the same axes, letting
% matlab assign the colour to each one,
% we can use the 'legend' function to 
% plot a legend ('mikra')
%

clf
plot (x,yz)
legend('sine','cosine')
clear
clf
clc



%
% Let's start playing with some data...
%

%
% The script temps.m (attached) prepares a vector called
% 'temperature' with temperatures from three 
% different places measured during a month.
%

load temps

%
% Let's plot the three temperatures
%

d = 1:31;
plot (d,temperature)
xlabel ('Day')
ylabel ('Temperature [C]')

%
% We can calculate the mean temperature
% at the three locations (like most similar
% functions, 'mean' calculates means of columns
% by default, but it can be changed - read 'doc mean')
%

avg_temp = mean(temperature);

%
% The following adds a dashed line for 
% each location, that shows the average temperature.
% There are many ways to do it, think for a
% moment to understand the way I chose to do it
%
% Note that the function 'repmat' replicates
% a matrix to build a larger one, according
% to the wanted number of replications.
% Read the 'doc'
%

hold 
doc repmat
plot ([1 31],repmat(avg_temp,2,1),'--')

%
% Here we calculate the median ('hetzion'),
% which is sometimes used instead of the mean.
% We plot it with a different line on the same plot.
%

median_temp = median(temperature);
plot ([1 31],repmat(median_temp,2,1),':')
