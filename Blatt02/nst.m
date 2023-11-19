function result = nst(p, q)
x1 = -p - sqrt(p*p + q);
x2 = -p + sqrt(p*p + q);
result = [x1, x2];
end