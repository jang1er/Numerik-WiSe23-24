function [A ,p] = lrPivotST(A)
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

    for i=k+1:n
        A(p(i),k) = A(p(i),k) / A(p(k),k);
    end
    
    for i=k+1:n
        for j = k+1:n
            A(p(i),j) = A(p(i),j) - A(p(i),k) * A(p(k),j);
        end
    end
end