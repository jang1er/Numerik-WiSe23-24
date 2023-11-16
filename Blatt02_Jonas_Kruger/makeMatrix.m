function L = makeMatrix(n)
L = rand(n,n); % make random matrix
for i=1:n
    L(i,i) = 1;
end
%L = L - diag(L) + eye(n);
L = tril(L);
