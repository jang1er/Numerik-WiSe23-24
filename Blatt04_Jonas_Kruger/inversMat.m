function inversA = inversMat(A)

n = size(A,1);
inversA = eye(n);
% transform A into upper triangle matrix
for k=1:n
    for j=k+1:n
        a = A(j,k) / A(k,k);
        A(j,:) = A(j,:) - A(k,:) .* a;
        inversA(j,:) = inversA(j,:) - inversA(k,:) .* a; % make same operation on inverse

    end
end

% transform A into diagonal matrix
for k=n:-1:1
    for j=k-1:-1:1
        a = A(j,k) / A(k,k);
        A(j,:) = A(j,:) - A(k,:) .* a;
        inversA(j,:) = inversA(j,:) - inversA(k,:) .* a; % make same operation on inverse
    end
end

% transform A into identity matrix
for k=1:n
    inversA(k,:) = inversA(k,:) ./ A(k,k); % make same operation on inversea
end