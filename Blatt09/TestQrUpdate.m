clearvars
clc
close all

i = 2:8;
n = 2.^i;

for j =1:size(i,2)
    m = n(j)*1.5;
    % construct Matrix A
    A = rand(m,n(j));

    % construct u, v
    u = rand(m,1);
    v = rand(n(j),1);
    % get QR decomposition
    [Q,R] = qr(A);
    % Rank 1 update
    An = A + u * v';
    % update qr 
    [Qn,Rn] = myQrUpdateRank1(Q,R,u,v);

    if not(istriu(Rn)) % check if triu
        disp('Rn is not upper triangle matrix');
    end

    tolerance = 14; % tolerance for floating point
    if not(isequal(eye(m), round(Qn*Qn', tolerance)))
        disp('Qn is not orthogonal');
    end

end
