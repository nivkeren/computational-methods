%
% INTERPOLATION
% ------------------------
%
% (to refresh your memory about interpolation
%  maybe you'd like to browse this wikipedia entry:
%  https://en.wikipedia.org/wiki/Interpolation )
%


%
% Matlab's function 'interp1' receives as input
% x and y values of functions at certain locations,
% and it interpolates them to get the values in other
% locations that are specified. Methods of interpolation
% go from 'nearest neighbor', through 'linear interpolation'
% to 'cubic interpolation'.
%

doc interp1

%
% Let's calulate the sine function at 60 points between
% 0 and 2*pi.
%

x1 = linspace(0,2*pi,60);

%
% Let's also sample this function at a much coarser
% sampling - only six points on the same interval.
%

x2 = linspace(0,2*pi,6);

%
% First, let's see the nice plot, of the fine sampling.
%

plot (x1,sin(x1))
hold

%
% Now let's see the coarse sampling. The function 'plot'
% simply connects the points with straight lines.
%

plot (x2,sin(x2),'--')

%
% Now let's interpolate. The function interp1
% gets the available points (here, the six points)
% and then the new x points where the function should
% be interpolated. By default the interpolation
% method is 'linear', i.e., straight lines simply connect
% the points.
%

z2 = interp1(x2,sin(x2),x1,'linear');
plot (x1,z2,'k')


%
% 'Nearest neighbor' interpolation simply takes the
% value of the nearest point (along x diretion).
%
u2 = interp1(x2,sin(x2),x1,'nearest');
plot (x1,u2,'m')

%
% 'Spline interpolation' connects the points with
% polynomials so that both the function and its
% derivatives are continuous. It's very good
% for very well-behaved, 'smooth' functions.
%

s2 = interp1(x2,sin(x2),x1,'spline');
plot(x1,s2,'g')


%
% Another example for interpolation - the human 
% hearing threshold as a function of the frequency
%
% The script spl_freq.m (attached) defines the
% minimum sound pressure level that the human
% ear is sensitive to. Hz - frequencies (in Hertz)
% spl - minimal sound pressure level.
%
spl_freq

plot (Hz,spl,'o-')

%
% Because of the nature of the x-axis data, it is
% better to use logarithmic scale only on this axis.
% this is obtained by plotting with semilogx instead
% of 'plot'. 
%

semilogx (Hz,spl,'o-')


%
% This is a good opportunity to introduce also the function
% 'loglog' which plots in logarithmic scale for both 
% x and y. In this case, since there are negative y values,
% it will 'protest' that it can't calculate all locations.
% 

loglog(Hz,spl,'-o');

%
% Back to semilogx
%

semilogx (Hz,spl,'o-')

%
% If we want to estimate the value of SPL at the
% frequency 2500 Hz, we can interpolate:
% (By the way, the notation 2.5e3 means 2.5*10^3)
%

interp1(Hz,spl,2500)

%
% We may believe that 'spline' will give a better
% interpolation.
%

interp1(Hz,spl,2500,'spline')

%
% Let's look more closely at the interval 
% between 2000 Hz and 5000 Hz, by interpolating
% at 100 points between those values. Let's 
% compare (visually) linear and spline interpolation.
%

Hzi = linspace(2000,5000);
spli = interp1(Hz,spl,Hzi,'spline');
hold
semilogx (Hzi,spli,'--r')

%
% Now we can estimate where the smallest
% point is. Obviously, the accuracy of the value
% we get depends on how much the interpolation
% is accurate.
%

min(spli)

%
% Usually we think of the function 'min' as such
% that simply gives us the value of 'y' at the minimum.
% It only goes over the vector it gets as input and
% finds the smallest one (no interpolation).
%
% However, if we supply it with two output arguments,
% the second one will be the index of the minimum in the
% vector.
%

doc min
[spl_min,ii] = min(spli)

%
% 'ii' is not the x (in this case Hzi) value, but the location
% in the vector ('index').
%

Hzi(ii)

%
% SORTING and FIND
% -------------
%
% Sorting is the action of rearranging the numbers in a 
% vector either in ascending or descending order.
% 
% To demonstrate sorting we'll need the function 'randperm'
% This function gets as input a natural number. It outputs 
% a vector with all the natural numbers up to the input value, 
% at a random order (no number repeats itself!).
%
randperm(8)
randperm(8)

x = randperm(8)

%
% The function 'sort' simply sorts the input
% vector in an ascending order.
%

doc sort
xs = sort(x)

%
% We can also sort the numbers in descending order.
%

xs = sort(x,'descend')

%
% If we specify an additional output argument,
% it outputs a vector with the original places 
% of each value in the sorted vector.
%

[xs,is] = sort(x);

%
% If we give 'sort' a matrix, by default it operates 
% along the columns. We can change this with an 
% additional input argument that will specify the
% dimension along which we want to sort.
%

A = [randperm(6)' randperm(6)' randperm(6)' randperm(6)']

sort(A,1)

clear


%
% The function 'find' is applied to a vector and then 
% outputs the indices where the value is not zero
% (actually, where it is a logical 'true')
% Example:
%
doc find

v = [12323 34 4 3  1 -43242 -6 6 0 45 0 -324 0];

find(v)

%
% This will return the indices where it is zero
%
find(v==0)

%
% We can use 'find' to change just the entries in the vector that 
% abides by some law, for example, the negative values:
%

v(find(v<0))*2

%
% If we really want to modify them, we'd rather first use 'find'
% to prepare a vector with all the relevant indices.
%

ind = find(v<0);
v(ind) = v(ind)*2;


