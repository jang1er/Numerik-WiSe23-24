function x = Linvb2_Vec(L ,b)
n = size(L,1);  % get size of matrix L
x = zeros(n,1); % define x solution vector

for i = 1:n
    x(i) = b(i) / L(i,i);   
    %for j=i+1:n % subtract x(j) * a_kj in each column
    %   b(j) = b(j) - L(j,i) * x(i);
    %end
    b(i+1:n) = b(i+1:n) - L(i+1:n,i) * x(i);
end
