function result = quadpoly(x, A, b, c)
[n,m] = size(A); % get size of Matrix A

if size(x,1) ~= n % check that dimensions of A and xT are the same
    error('Dimensionen von A und x stimmen nicht überein')
end

if size(b,1) ~= n % check that dimensions of x and bT are the same
    error('Dimensionen von A und b stimmen nicht überein')
end
% calculate first sum
sum1 = 0.5 * transpose(x) * A * x; % 0.5xT*A*x

% caclculate second sum
sum2 = transpose(b)*x;

result = sum1 + sum2 + c; % add first and second sum with c for final result
end