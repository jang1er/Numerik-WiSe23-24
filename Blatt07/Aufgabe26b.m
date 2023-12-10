clearvars
close all
clc

A =[1,1;1,2;1,2;1,5];
b = [2;2;4;6];

% i)
[Q, R] = qr_Householder(A);
n = size(A,2);
tmp = Q'*b;
b1 = tmp(1:n);
R = R(1:n,1:n);
x = Rinvb2(R,b1);
disp(x);

% ii)
A = qr_Householder(A);
R = triu(A);
n = size(A,2);
tmp = prod_qtx(A,b);
b1 = tmp(1:n);
R = R(1:n,1:n);
x = Rinvb2(R,b1);
disp(x);