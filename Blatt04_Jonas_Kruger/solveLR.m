function x = solveLR(A, b)

%   Solve Ax = b with L R:
%   First Compute: Lb = y
%   Then Compute Ry = x
n = size(A,1);
% Lb = y
y = zeros(n,1);
for i = 1:n
    y(i) = b(i);   
    for j=i+1:n % subtract x(j) * a_kj in each column
        b(j) = b(j) - A(j,i) * y(i);
    end
end

% Ry = x
x = zeros(n,1); % define x solution vector

for i = n:-1:1
    x(i) = y(i)/A(i,i);   
    for j=1:i-1 % subtract x(j) * a_kj in each column
        y(j) = y(j) - A(j,i) * x(i);
    end
end
