function x = solveLrPivot(A,b)
[L, R, p] = lrPivotZP(A);
n = size(A,1);
% Construct P-Matrix
P = eye(n);
P(:,p) = P;

% solve Ly = Pb
y = Linvb2(L, P*b);
% solve Rx = y
x = Rinvb2(R, y);
