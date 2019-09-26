% Class Work 7 Solution

% a
% scatter plot

scatter(x,y)

% b
% fitting 
p2=polyfit(x,y,2);
p3=polyfit(x,y,3);
p4=polyfit(x,y,4);
p5=polyfit(x,y,5);
p6=polyfit(x,y,6);

% c 
% ploting the polynoms 
hold on
plot(x,polyval(p2,x));
plot(x,polyval(p3,x));
plot(x,polyval(p4,x));
plot(x,polyval(p5,x));
plot(x,polyval(p6,x));

legend('y','p2','p3','p4','p5','p6')

% d
% new x and y
x1=x(5:10:95);
y1=polyval(p5,x1);

% plot
figure
scatter(x1,y1)
hold on


% interpolation
nearest_interp=interp1(x1,y1,x,'nearest');
linear_interp=interp1(x1,y1,x);
spline_interp=interp1(x1,y1,x,'spline');
% plot
plot(x,nearest_interp,'--','linewidth',3)
plot(x,linear_interp,'--','linewidth',3)
plot(x,spline_interp,'--','linewidth',3)
legend('y','nearest','linear','spline')