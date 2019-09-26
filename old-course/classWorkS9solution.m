% class work 7
% Optimization


fun1 = @(x) x^2-x;

fun2 = @(x) sin(x^2);

ezplot(fun1,[0 pi]); 
hold
ezplot(fun2,[0 pi]);

fun3= @(x) x^2-x-sin(x^2);

fzero(fun3,2,optimset('tolx',1e-8,'display','iter'))

