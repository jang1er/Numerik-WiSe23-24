function [x, uF] = solveQR(Q, R, b)

% { 
% how to solve:
% || Ax - b||^2 = || Q' (Ax - b) ||^2  = ||Q'Ax - Q'b ||^2 
% = || Rx - c ||^2 + ||d||^2 mit Q'b = (c,d) für c -> R^n und d -> R^(m-n)
% 
%   Q = R^mxm, R = R^mxn
% }%
m = size(Q,1);
n = size(R,2);

% berechne c und d
b = Q'*b;
c = b(1:n);
d = b(n+1:m);

uF = norm(d)^2;

x = zeros(n,1);
% solve with "Rückwärtseinsetzen"
for i = n:-1:1
    for j = i+1:n
        c(i) = c(i) - R(i,j)*x(j);
    end
    x(i) = c(i)/R(i,i);
end