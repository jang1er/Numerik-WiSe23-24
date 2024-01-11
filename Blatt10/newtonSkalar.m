function xk = newtonSkalar(f, df, x0, toly, maxIt)
x1 = x0 - f(x0)/df(x0);

xk = [x1;x0;x1];

while abs(f(x1)) > toly && maxIt > size(xk,1)/3
    x0 = x1;
    x1 = x0 - f(x0)/df(x0);
    xk = [xk;x1;x0;x1];
end