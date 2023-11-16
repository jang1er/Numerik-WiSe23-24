function [L, R, p] = lrPivotZP(A)
n = size(A,1);
p = 1:n;

for k = 1:n-1
    [~, maxIn] = max(abs(A(p(k:n),k)));
    tmp = p(k);
    p(k) = p(k-1+maxIn);
    p(k-1+maxIn) = tmp;

    for i = k+1:n
        A(p(i),k) = A(p(i),k) / A(p(k),k);
        for j = k+1:n
            A(p(i),j) = A(p(i),j) - A(p(i),k)*A(p(k),j);
        end
    end
end
L = tril(A(p,:),-1) + eye(n);
R =  triu(A(p,:));