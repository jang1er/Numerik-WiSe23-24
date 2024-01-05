function [Q, R] = myQrUpdateRank1(Q, R, u, v)

u = Q' * u;
% (n-2) Iterations 
for i = size(R,1):-1:3
    rotation = givensRot(u(i-1),u(i));
    u([i,i-1]) = rotation * u([i,i-1]);
    Q(:,[i,i-1]) = Q(:,[i,i-1]) * rotation';
    R([i,i-1],:) = rotation * R([i,i-1],:);
end
R(1:2,:) = R(1:2,:) + u(1:2) * v';

% n-1 Iterationen
for j = 1:min(size(R,1)-1, size(R,2))
    rotation = givensRot(R(j,j),R(j+1,j));
    R([j+1,j],j:end) = rotation * R([j+1,j],j:end);
    Q(:,[j+1,j])  = Q(:,[j+1,j]) * rotation';
    R(j+1,j) = 0;
end

end

% b)
% Givensrotationen sind O(n)
% erste Schleife ~= (n-2) * O(n) = O(n²)
% zweite Schleife ~= (n-1) * O(n) = O(n²)
% ==> O(n²)



function rotation = givensRot(ap, aq)
if ap == 0
    s = 1; c = 0;
elseif aq == 0
    s = 0; c = 1;
else
    dist = sqrt(ap^2+aq^2);
    c = abs(ap)/dist;
    s = -sign(ap)*aq/dist;
end
rotation = [c, s; -s, c];
end