function inversA = inversMat(A)

%
%   Komplexität des Algorithmus : O(n^3)
%
n = size(A,1);
% LR Zerlegung
[A, p] = lrPivotVT(A);
E = eye(n); % define Identity Matrix
P = eye(n); % define Permutation Matrix
P(:,p) = P; % make Permutation Matrix

inversA = zeros(n); % define A^-1
for i=1:n
    % solve A*x = E(i) ==>x is A^-1(i)
    b = E(:,i);
    x = solveLR(A, P*b);
    inversA(:,i) = x;   % construct inverse A
end