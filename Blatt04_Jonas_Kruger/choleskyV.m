function L = choleskyV(A)
n = size(A,1);
L = zeros(n);

for k = 1:n
    temp = A(k,k) - dot(L(k,1:(k-1)),L(k,1:(k-1)));
    if(temp < 0)    % check if cholesky-disassembly is possible
        disp('Cholesky Zerlegung nicht möglich. Matrix nicht symmetrisch oder positiv definit.')
    return
    end
    L(k,k) = sqrt(temp);
    ai = k+1:n;
    %    L(i,k) = (A(i,k)- (L(i,j) .* L(k,j)) )./L(k,k);

     i=k+1:n;   % define i
     j = 1:(k-1);   % define j
     temp = sum((L(i,j).*L(k,j)),2); % sum the product of 
                                     % L(i,j)*L(k,j) as vector
     L(i,k) = (A(i,k)-temp)/L(k,k);  % compute L(i,k)
end