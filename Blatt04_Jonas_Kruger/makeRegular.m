function A =makeRegular(n)
A = rand(n);
A = abs(tril(A));
A = A + A';