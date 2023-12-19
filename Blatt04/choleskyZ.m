function L = choleskyZ(A)
n = size(A,1);  % get Matrix size
L = zeros(n);   % init L-Matrix

for k = 1:n 

    for i=1:(k-1)
        temp = 0;
        for j=1:(i-1)
            temp = temp + L(i,j) * L(k,j);
        end
        L(k,i) = (A(i,k)-temp)/L(i,i);
    end

    temp = 0;
    for j = 1:(k-1)
        temp = temp + (L(k,j)^2);
    end
    temp = A(k,k) - temp;
    if(temp < 0)    % check if cholesky-disassembly is possible
        disp('Cholesky Zerlegung nicht möglich. Matrix nicht symmetrisch und/oder positiv definit.');
        return
    end
    L(k,k) = sqrt(temp);
end