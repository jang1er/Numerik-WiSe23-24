function xk = regulaFalsi(f, a, b , toly, maxIt)
% pre define xk
xk = [];

fa = f(a);
fb = f(b);

% first manual ieration
m = (a*fb - b * fa) / (fb - fa);
fm = f(m);
xk = [xk;m;a;b];


while abs(fm) > toly && maxIt > (size(xk,1)-2)
    if fa*fm < 0
        b = m;
        fb = fm;
    else
        a = m;
        fa = fm;
    end
m = (a * fb - b * fa) / (fb -fa);
fm = f(m);
xk = [xk;m;a;b];
end