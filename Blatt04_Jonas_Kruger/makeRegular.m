function A =makeRegular(n)
% das funktioniert nur selten
A = randi(n,n);
A = abs(tril(A));
A = A + A';