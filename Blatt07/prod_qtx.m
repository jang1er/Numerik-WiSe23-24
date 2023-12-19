function y = prod_qtx(A,x)
y = x;
for j = 1:size(A,2)
    v = [1;A(j+1:end,j)];
    beta = 2/(v'*v);
    y(j:end) = y(j:end) - beta*v*(v'*y(j:end)); 
end



