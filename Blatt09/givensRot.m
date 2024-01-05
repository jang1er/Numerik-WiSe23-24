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