function [A ,p] = lrPivotVT(A)
n = size(A,1);
p = 1:n;

for k = 1:n-1
    [~, mptr] = max(abs(A(p(k:n),k))); % get pivot element
    tmp = p(k); % temp storage
    mptr = k-1 + mptr; % correct pointer
    p(k) = p(mptr);    % switch in permutation vector
    p(k-1+mptr) = tmp;
    % switch rows
    A([k,mptr],:) = A([mptr,k],:);

    i = k+1:n;
    j = k+1:n;
    A(i,k) = A(i,k) ./ A(k,k);
    A(i,j) = A(i,j) - A(k,j) .* A(i,k);
end