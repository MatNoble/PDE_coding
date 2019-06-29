syms x y
% u = sin(x*y*(x-1)*(y-1));
% u = sin(x*(x-1))*sin(y*(y-1));
u = exp((1/2 - x)^2) + exp((1/2 - y)^2);
f = -divergence(gradient(u));

f
