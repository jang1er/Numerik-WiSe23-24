function L = cholesky(A)
n = size(A,1);  % get Matrix size
L = zeros(n);   % init L-Matrix

for k = 1:n
    temp = 0;   % init temp 
    for j = 1:(k-1)
        temp = temp + (L(k,j)^2);
    end
    temp = A(k,k) - temp;
    if(temp < 0)    % check if cholesky-disassembly is possible
        disp('Cholesky Zerlegung nicht möglich. Matrix nicht symmetrisch und positiv definit.');
        return
    end
    L(k,k) = sqrt(temp);
    
    for i=k+1:n
        temp = 0;
        for j=1:(k-1)
            temp = temp + L(i,j) * L(k,j);
        end
        L(i,k) = (A(i,k)-temp)/L(k,k);
    end
end