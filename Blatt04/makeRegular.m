function A =makeRegular(n)
% das funktioniert nur selten
A = randi(n,n);
A = A ./ diag(A);