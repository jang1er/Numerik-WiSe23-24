clearvars
close all
clc

% Aufgabe 22
A =[4,2;3,-1;5,-2];
[Q,R] = qr_Givens(A);
Q * R

% Aufgabe 25
A = [1,1;1,2;1,2;1,5];
b = [2;2;4;6];
[Q,R] = qr_Givens(A);
Q*R