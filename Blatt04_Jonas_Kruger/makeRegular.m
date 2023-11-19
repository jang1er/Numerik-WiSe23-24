function A =makeRegular(n)
A = randi(n,n);
A = abs(tril(A));
A = A + A';