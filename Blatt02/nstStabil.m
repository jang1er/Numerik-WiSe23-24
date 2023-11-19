function result = nstStabil(p, q)
u = sqrt(p*p + q);
x1 = q / (p + u);
x2 = -(p + u);
result = [x1, x2];
end