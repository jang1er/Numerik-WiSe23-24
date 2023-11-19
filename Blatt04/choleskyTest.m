close all
clearvars
clc

A = [1,1,0;-1,1,-1;0,-1,2];
B = [1,2,1;2,8,1;1,1,-8];
C = [1,2,1;2,8,2;1,2,2];

cholesky(A)
cholesky(B)
cholesky(C)

choleskyV(A)
choleskyV(B)
choleskyV(C)

choleskyZ(A)
choleskyZ(B)
choleskyZ(C)