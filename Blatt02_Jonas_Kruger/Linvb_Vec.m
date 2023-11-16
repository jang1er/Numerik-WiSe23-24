function x = Linvb_Vec(L,b)
n = size(L,1);  % dimension of L matrix
x = zeros(n,1); % define x solution vector

% main loop to go through vector
for j = 1:1:n
    %for k = 1:1:j
    %b(j) = b(j) - L(j,k) * x(k);
    %end
    %b(j) = b(j) - (L(j,1:j) * x(1:j));
    b(j) = b(j) - dot(L(j,1:j),x(1:j));

    x(j) = b(j) / L(j,j);
end