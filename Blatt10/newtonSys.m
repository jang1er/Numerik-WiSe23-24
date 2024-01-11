function xk = newtonSys(f, df, x0, toly, maxIt)
xk = [];
fx = f(x0);
while norm(fx) > toly && size(xk,2) <= maxIt
    x0 = x0 - df(x0)\fx;
    fx = f(x0);
    xk = [xk,x0];
end