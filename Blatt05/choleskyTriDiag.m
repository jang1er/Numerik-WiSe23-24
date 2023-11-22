function L = choleskyTriDiag(A)
n = size(A,1);
spA = spdiags(A);
L = eye(n);

L(1,1) = sqrt(spA(1,2));
for k = 2:n
    L(k,k-1) = spA(k-1,1) / L(k-1,k-1);
    L(k,k) = sqrt(spA(k,2)-L(k,k-1)^2);
end