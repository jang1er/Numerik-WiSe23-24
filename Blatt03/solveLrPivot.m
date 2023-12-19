function x = solveLrPivot(A,b)
[A, p] = lrPivotZP(A);
n = size(A,1);
% Construct P-Matrix
P = eye(n);
P(:,p) = P;

n = size(A,1);

b = P*b; % Permute b-Vector for solution
% Lb = y
y = zeros(n,1);
for i = 1:n
    y(i) = b(i);   
    for j=i+1:n % subtract y(j) * a_ji in each column
        b(j) = b(j) - A(p(j),i) * y(i);
    end
end

% Ry = x
x = zeros(n,1); % define x solution vector

for i = n:-1:1
    x(i) = y(i)/A(p(i),i);   
    for j=1:i-1 % subtract x(j) * a_ji in each column
        y(j) = y(j) - A(p(j),i) * x(i);
    end
end

