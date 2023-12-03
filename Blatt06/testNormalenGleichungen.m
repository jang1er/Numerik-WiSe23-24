clearvars
clc
close all

% number of cases
n = 13;


fm = zeros(n,1);
fng = zeros(n,1);
fqr = zeros(n,1);

for i =1:n
    An = [hilb(i); hilb(i)];
    xn = rand(i,1);

    bn = An * xn;

    % MatLab Lösung
    xm = An\bn;

    % Normalengleichung Lösng
    xng = (An' * An)\(An' * bn);

    disp('Konditionen der NormalenGleichung');
    disp(cond(An));
    disp(cond(An' * An));

    % QR-Zerlegung Lösung
    [Q, R] = qr(An);
    [xqr, uF] = solveQR(Q, R, bn);

    % Fehlerberechnung
    fm(i) = norm(abs((xm-xn)/xn));
    fng(i) = norm(abs((xng-xn)/xn));
    fqr(i) = norm(abs((xqr-xn)/xn));
end

t = 1:n;
axes('XScale', 'log', 'YScale', 'log');
hold on;
loglog(t, fm, 'r');
loglog(t, fng, 'b');
loglog(t, fqr, 'g');
hold off;
legend('Backslash','NormalenGleichung','QR-Zerlegung');