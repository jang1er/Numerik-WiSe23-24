function [A ,p] = lrPivotZT(A)
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


    for i = k+1:n
        A(i,k) = A(i,k) / A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end