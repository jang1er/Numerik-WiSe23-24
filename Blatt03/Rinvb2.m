function x = Rinvb2(R ,b)
n = size(R,1);  % get size of matrix L
x = zeros(n,1); % define x solution vector

for i = n:-1:1
    x(i) = b(i) / R(i,i);   
    for j=1:i-1 % subtract x(j) * a_kj in each column
        b(j) = b(j) - R(j,i) * x(i);
    end
end
