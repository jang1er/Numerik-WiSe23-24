function x = Linvb(L,b)
n = size(L,1);  % dimension of L matrix
x = zeros(n,1); % define x solution vector

% main loop to go through vector
for j = 1:1:n
    for k = 1:1:j
        b(j) = b(j) - L(j,k) * x(k);
    end
    x(j) = b(j) / L(j,j);
end
