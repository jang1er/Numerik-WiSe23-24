function [Q, R] = qr_Givens(A)

[m, n] = size(A);
Q = eye(m);

for j =1:n
    for i = j+1:m
        rotation = givensRot(A(j,j),A(i,j));
        A([j,i],j:end) = rotation * A([j, i], j:end);
        Q(:,[j,i]) = Q(:,[j,i]) * rotation';
    end
    A(j+1:end,j) = 0;
end
R = A;