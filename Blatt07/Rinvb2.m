function x = Rinvb2(R,z)
% compute solution of R*x=z
% with upper triangular R

n = size(R,1);
x = zeros(n,1);
for j = n:-1:1
    x(j) = z(j) / R(j,j);
    for k = 1:j-1
        z(k) = z(k) - R(k,j) * x(j);
    end
end