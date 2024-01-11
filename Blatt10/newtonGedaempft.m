function xk = newtonGedaempft (f, df, x0, tol, maxIt)
xk = [];
fx = f(x0) ;
dfx = df(x0) ;
s = - dfx \ fx ;
lam = 1;
tmp = max ( tol , tol * norm ( s ) ) ;
while norm ( s ) > tmp && size(xk,2) <= maxIt
xk = [xk,x0];
x0_old = x0 ;
lam = min (1 ,2* lam ) ;
for k =1:30
x0 = x0_old + lam * s ; % Daempfxng mit Parameter lam
fx = f(x0) ;
if norm ( dfx \ fx ) <= (1 - lam /2) * norm ( s )
break
% Abbrx0ch der for - Schleife , falls
end
% Konvergenztest erfuellt
lam = lam /2;
% lam noch zx0 gross - - > halbieren
end
dfx = df(x0) ;
s = - dfx \ fx ;
end