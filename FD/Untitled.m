syms x y
% u = sin(x*y*(x-1)*(y-1));
u = sin(x+y)
f = -divergence(gradient(u));

f
