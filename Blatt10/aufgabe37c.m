close all
clc
clearvars

% (x+ iy)^3 -1 = (x²+2xiy-y²)(x+iy)-1 
% = x³ + 2x²iy - xy² + x²iy - 2xy² -iy³ - 1
% => real: x³ - 3xy² - 1
%    imang.: 3x²iy - iy³
f = @(x)[x(1).^3 - 3.*x(1).*x(2).^2 - 1; 3.*x(1).^2.*x(2) - x(2).^3];

df = @(x)[3.*x(1).^2 - 3.*x(2).^2 , -6.*x(1).*x(2); ...
      6.*x(1).*x(2)           , 3.*x(1).^2 - 3.*x(2).^2
];

x0 = [0.5;0.5];

xk = newtonSys(f, df, x0, 1e-10, 100);