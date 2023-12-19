clearvars
close all 
clc

xi = [-1.6;-0.9;0.75;2.7];
yi = [1.6;-0.9;1;-1];

a1 = xi.^2;
a2 = xi .* yi;
a3 = yi.^2;
A = [a1,a2,a3];

b = [10;10;10;10];

[Q,R] = qr(A);
[x, ~] = solveQR(Q,R,b);
alpha = x(1);
beta = x(2);
gamma = x(3);

f=@(x,y) alpha.*x.^2 + beta.*x.*y + gamma.*y.^2 - 10;
disp(f(-1.6, 1.6))
hold on;
fimplicit(f);
scatter(xi,yi);
hold off;
legend("Ellipse","Messpunkte")






