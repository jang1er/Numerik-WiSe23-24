function x = solveLR(A, b)
[L, R] = kompaktLR(A);  % get L and R-Matrix

%   Solve Ax = b with L R:
%   First Compute: Lb = y
%   Then Compute Ry = x

% Lb = y
y = Linvb2(L, b);
% Ry = x
x = Rinvb2(R, y);
