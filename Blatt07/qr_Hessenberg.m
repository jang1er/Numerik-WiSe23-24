function [Q, R] = qr_Hessenberg(A)

[m, n] = size(A);
Q = eye(m);

for j =1:n-1
        rotation = givensRot(A(j,j),A(j+1,j));
        A([j,j+1],j:end) = rotation * A([j, j+1], j:end);
        Q(:,[j,j+1]) = Q(:,[j,j+1]) * rotation';
    A(j+1:end,j) = 0;
end
R = A;