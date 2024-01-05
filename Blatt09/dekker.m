function xk = dekker(f, a, b, tol, maxIt)
xk = [];
bminus = a;
for i=0:maxIt   
    s = b - (b - bminus)/(f(b)-f(bminus))*f(b);
    m = (a + b)/2;
    bminus = b;

    if m < s && s < b
        b = s;
    else
        b = m;
    end
    if abs(f(b)) <= tol
        xk = [xk;b;a;b];
        return;
    end
    if f(b)*f(a) >= 0
        a = bminus;
    end
    xk = [xk;b;a;b];
end