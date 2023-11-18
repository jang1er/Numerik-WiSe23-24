function [A ,p] = lrPivotVP(A)
n = size(A,1);
p = 1:n;

for k = 1:n-1
    [~, maxIn] = max(abs(A(p(k:n),k))); % get pivot element
    tmp = p(k); % temp storage
    p(k) = p(k-1+maxIn);    % switch in permutation vector
    p(k-1+maxIn) = tmp;

    i = k+1:n;
    j = k+1:n;
    A(p(i),k) = A(p(i),k) ./ A(p(k),k);
    A(p(i),j) = A(p(i),j) - A(p(k),j) .* A(p(i),k);
end