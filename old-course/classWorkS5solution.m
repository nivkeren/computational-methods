% class work 4
% plots

%
% The script temps.m (attached) prepares a vector called
% 'temperature' with temperatures from three 
% different places measured during a month.
%
% load the data to the Workspace
load temps.mat

%
% plot the three temperatures on the same figure
% 

d = 1:31;
plot (d,temperature)

% add labels: 'day of month' and 'temperature [C]'
xlabel ('day of month')
ylabel ('temperature [C]')

%
% We can calculate the mean temperature
% at the three locations (like most similar
% functions, 'mean' calculates means of columns
% by default, but it can be changed - read 'doc mean')
%
% create a varible with the 3 average temperatures of the 3 sites
avg_temp = mean(temperature);

%
% add a dashed line for each location, that shows the average temperature.
% 

% Note that the function 'repmat' replicates
% a matrix to build a larger one, according
% to the wanted number of replications.
%

hold 
doc repmat
plot ([1 31],repmat(avg_temp,2,1),'--')


%
% calculate the median ('hetzion'),
% which is sometimes used instead of the mean.
% plot it with a different line on the same plot.
%

median_temp = median(temperature);
plot ([1 31],repmat(median_temp,2,1),'-.')

% *more things to do:
% add legend, add title, add grid...
grid
legend('Beit Dagan','Jerusalem','Mitzpe Ramon','Beut Dagan mean','Jrusalem mean','Mitzpe Ramon mean','Bet Dagan median','Jerusalem median','Mitzpe Ramon median')
