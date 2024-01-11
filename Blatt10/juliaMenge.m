close all
clc
clearvars


% function handle
f = @(x)[x(1).^3 - 3.*x(1).*x(2).^2 - 1; 3.*x(1).^2.*x(2) - x(2).^3];
% jacobi matrix as function handle
df = @(x)[3.*x(1).^2 - 3.*x(2).^2 , -6.*x(1).*x(2); ...
      6.*x(1).*x(2)           , 3.*x(1).^2 - 3.*x(2).^2
];
n = 2000; % number of points to be used
m = linspace(-2,2,n);
points = zeros(n,n);
iterations = zeros(n,n);

[X,Y] = meshgrid(m);

for i=1:n
    for j=1:n
        xk = newtonSys(f, df, [X(i,j);Y(i,j)], 1e-10, 1000);
        iterations(i,j) = size(xk,2);
        points(i,j) = getVariation(xk(:,end),1e-10);
    end
end
figure(1)
surf(X,Y,points);
shading flat
title('Konvergenzwerte')
view(2);

figure(2)
surf(X,Y,iterations);
shading flat
title('Iterationsschritte')
view(2);

function s = getVariation(xk, tol)
% solutions for z³ = 1
sol1 = [1;0];
sol2 = [-0.5;sqrt(3)/2];
sol3 = [-0.5;-sqrt(3)/2];

if(abs(xk - sol1) < tol)
    s = 1;
elseif(abs(xk - sol2) < tol)
    s = 2;
elseif(abs(xk - sol3) < tol)
    s = 3;
else
    s = 4;
end
end