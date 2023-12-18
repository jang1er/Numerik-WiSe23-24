clearvars
clc
close all

% function definition
f = @(x) x.^2 - cos(x);

% get exact solution
x = fzero(f,1);

xkBisek = bisektion(f,0,3,1e-14);
xkFalsi = regulaFalsi(f, 0,3, 1e-14,100);
xkSek = sekanten(f, 0, 3, 1e-14, 100);

nBisek = size(xkBisek,1)/3;
nFalsi = size(xkFalsi,1)/3;
nSek = size(xkSek,1)/3;

xi = @(i) 3*i+1;
ai = @(i) xi(i) +1;
bi = @(i) xi(i) +2;

errorBisek = abs(xkBisek(xi(0:nBisek-1)) -x);
errorFalsi = abs(xkFalsi(xi(0:nFalsi-1)) - x);
errorSek = abs(xkSek(xi(0:nSek-1)) - x);
figure;
hold on;
semilogy(errorBisek);
semilogy(abs(xkBisek(ai(0:nBisek-1)) - xkBisek(bi(0:nBisek-1))));
semilogy(errorFalsi);
semilogy(errorSek);
set(gca, 'yscale','log');
hold off;
legend('Error Bisection','Bisek:Interval length','Error Falsi','Error Sekanten')


% e)

% function definition
f = @(x) (x-1).^2;

% get exact solution
x = fzero(f,1);

xkBisek = bisektion(f,-0.1,3,1e-14);
xkFalsi = regulaFalsi(f, -0.1,3, 1e-14,300);
xkSek = sekanten(f, -0.1, 3, 1e-14, 300);

nBisek = size(xkBisek,1)/3;
nFalsi = size(xkFalsi,1)/3;
nSek = size(xkSek,1)/3;

xi = @(i) 3*i+1;
ai = @(i) xi(i) +1;
bi = @(i) xi(i) +2;

errorBisek = abs(xkBisek(xi(0:nBisek-1)) -x);
errorFalsi = abs(xkFalsi(xi(0:nFalsi-1)) - x);
errorSek = abs(xkSek(xi(0:nSek-1)) - x);
figure;
hold on;
semilogy(errorBisek);
semilogy(abs(xkBisek(ai(0:nBisek-1)) - xkBisek(bi(0:nBisek-1))));
semilogy(errorFalsi);
semilogy(errorSek);
set(gca, 'yscale','log');
hold off;
legend('Error Bisection','Bisek:Interval length','Error Falsi','Error Sekanten')
