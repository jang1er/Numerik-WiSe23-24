function A = kompaktLR(A)
    n = size(A,1);
    for k=1:n
        for i=k+1:n
            %if (A(k,k) == 0)
            %    error('Keine LR-Zerlegung möglich');
            %end
            A(i,k) = A(i,k)/A(k,k);
            for j=k+1:n
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
            end
        end
    end
end