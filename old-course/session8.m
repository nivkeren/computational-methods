%
% Three-dimensonal graphics
% -------------------------
%
% If we just want to plot continuous lines in 
% the 3-D space, we use plot3, with very similar
% syntax to that of plot.
%

doc plot3

%
% The following lines produce a 3-D spiral
%

clf
t = linspace(0,10*pi);
plot3(cos(t),sin(t),t)
grid
text(0,0,0,'origin')

%
% As it turns out, a useful tool for 3-D graphics is
% 'meshgrid' - a function that transforms the domain
% defined by two vectors (x and y) into two arrays
% (X and Y). It simply replicates the vector x as rows
% and the vector y as columns.
%

doc meshgrid
x = -2:2
y = 0:3
[X,Y] = meshgrid(x,y)

%
% We can now calculate a matrix that will 
% give x^2+y^2
%

Z = X.^2+Y.^2

%
% 'mesh' plots z as a function of x and y, as 
% 'tiles', or rectangles. the surfaces are white,
% opaque, and the mesh lines are coloured according
% to the value of Z.
%

doc mesh
mesh(X,Y,Z)

%
% For demonstartion purposes we'll frequently use the function 'peaks' .
% 'peaks' is just a function used for example pueposes since it produces 
% an example of a visually nice 3d function, for training purposes.
%

doc peaks
[X,Y,Z] = peaks(30);
mesh(X,Y,Z)
[X,Y,Z] = peaks(100);
mesh(X,Y,Z)

%
% Another interesting function for the same
% purpose is 'sphere'
%
%
% In the following lines of code we produce two
% spheres. The left one shows that the 'tiles'
% are opaque. 
% The command 'axis square'  makes sure that all
% the axes have the same scale.
% The command 'axis off' erases the axes
% we can combine them to 'axis square off'
%

doc sphere
subplot(121)
[X,Y,Z] = sphere;
mesh(X,Y,Z);
axis square
axis off

subplot(122)
mesh(X,Y,Z);
axis off

%
% We can also make the tiles 'transparent' using the function 'hidden'
%
doc hidden
hidden off
hidden on
hidden off

%
% Another 3D plotting option is 'surf', which draws
% a surface.
%

doc surf
clf
surf(X,Y,Z)

%
% We can control the way the 'tiles' are coloured
% by the command 'shading'.
% 'shading interp' makes the colouring continuous.
% 'shading flat' keeps a constant colour across a 
% single tile.
%

doc shading
shading flat
shading faceted
shading interp

%
% 'surfl' adds a 'lighting' option, where 'shadow' can be
% seen acording to the direction where the lighting comes
% from.
%

surfl(X,Y,Z,90)
shading interp
surf(X,Y,Z)

%
% The scheme to convert z values to colours is defined
% by a 'colormap'
%

doc colormap
colormap pink
colormap copper
colormap hot

%
% The function 'contour' draws a contour plot
% ('topographic map')
%
clf
[X,Y,Z] = peaks(100);
contour(X,Y,Z)

%
% We can specify the number of the levels
%

contour(X,Y,Z,20)

%
% We can specify the levels themselves
%

contour(X,Y,Z,[-1 0 1])
surf(X,Y,Z)
contour(X,Y,Z)
contour(X,Y,Z,20)
contour(X,Y,Z,[-1 0 1])

%
% We can label the lines of a contour using
% the function clabel applied on the output
% of the 'contour' function.
%
% If we add the string argument 'manual', 
% matlab allows us to pick interactively the
% lines we want to label.
%

doc clabel
c = contour(X,Y,Z,[-1 0 1]);
clabel(c,'manual')

%
% 'pcolor' draws a map with colours signifying
% the height (a 'pseudocolor' map).
%
 
doc pcolor
pcolor(X,Y,Z)
shading interp


%
% 2-D interpolation
% -----------------------------

%
% The script 'ocean' produces a two-dimensional
% surface that describes measurements of the ocean
% depth ( the script ocean.m is attached).
%
ocean

mesh (x,y,z)

%
% We can use the interp2 function to interpolate to intermediate
% values of x and y.
%

doc interp2
zi = interp2(x,y,z,2.2,3.3)

%
% Similar tp 'interp1' we can interpolate in several
% methods. Linear interpolation is the default.
%

%
% spline polynomial interpolation
%

zi = interp2(x,y,z,2.2,3.3,'spline')

%
% 'nearest neighbor' interpolation
%

zi = interp2(x,y,z,2.2,3.3,'nearest')

%
% Let's produce the function in a finer grid
% using spline interpolation.
%
xi = linspace(0,4,30);
yi = linspace(0,6,40);
[xxi,yyi] = meshgrid(xi,yi);
zzi = interp2(x,y,z,xxi,yyi,'spline');

%
% Let's plot the resulting function 
%
mesh(xxi,yyi,zzi)

%
% It's interesting to plot (with red circles)
% the original values and see how the interpolation
% goes through them
%

hold
Current plot held
[xx,yy] = meshgrid(x,y);
plot3(xx,yy,z,'or')

