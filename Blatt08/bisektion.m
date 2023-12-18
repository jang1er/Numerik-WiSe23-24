function xk = bisektion(f, a, b, tolx)
% define xk
xk = [];

fa = f(a);
fb = f(b);

while abs(a - b) > tolx
    m = (a + b) / 2;
    fm = f(m);
    if fm == 0
        xk = [xk;m;a;b];
        return;
    elseif fa*fm < 0
        b = m;
        fb = fm;
    else
        a = m;
        fa = fm;
    end
    xk = [xk;m;a;b];
end