clearvars
clc
close all

for i=3:6
    A = rand(i);
    H = hess(A);
    [Q,R] = qr_Hessenberg(H);
    Q*R - H
end