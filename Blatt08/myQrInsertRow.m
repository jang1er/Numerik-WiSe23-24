function [Q,R] = myQrInsertRow(Q,R,i,x)

% fuck tihis, this code does jack shit

% x einfügen in R
R = [R(1:i-1,:);x;R(i+1:end,:)]

% R updaten
for j = i:size(R,2)
    rot = givensRot(R(i-1,j),R(i,j));
end


end


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
rotation = [c, -s; s, c];
end