function xk = sekanten (f, x0, x1, toly, maxIt)
% pre define xk with x0, x1
xk = [];

f0 = f(x0);
f1 = f(x1);

while abs(f1) > toly && maxIt > (size(xk,1)/3)
    temp = x1;
    x1 = x1 - f1 * (x1-x0) / (f1 - f0);
    x0 = temp;
    f0 = f1;
    f1 = f(x1);
    xk = [xk;x1;x0;x1];
end