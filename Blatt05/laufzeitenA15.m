close all
clearvars
clc

n = 2.^(3:9);
timeCH = zeros(size(n,2),1);
timeCHV = zeros(size(n,2),1);
timeCHZ = zeros(size(n,2),1);
timeCHTRI = zeros(size(n,2),1);

for i=1:size(n,2)
    % construct Matrix A 
    tic
    v(1:n(i)) = 2;
    vv(1:n(i)-1) = -1;
    A =diag(v);
    A = A + diag(vv,1);
    A = A + diag(vv,-1);
    
    tic
    [~] = cholesky(A);
    timeCH(i) = toc;

    tic
    [~] = choleskyV(A);
    timeCHV(i) = toc;

    tic 
    [~] = choleskyZ(A);
    timeCHZ(i) = toc;

    tic
    [~] = choleskyTriDiag(A);
    timeCHTRI(i) = toc;

end

% compute 
m = eye(4,1);
m(1) = timeCH(end);
m(2) = timeCHZ(end);
m(3) = timeCHV(end);
m(4) = timeCHTRI(end);

avg_m = mean(m);
figure(1);
hold on;
loglog(n, timeCH);
loglog(n, timeCHV);
loglog(n, timeCHZ);
loglog(n, timeCHTRI); 
loglog([n(1) n(end)], [0 avg_m]); % plot average m
hold off;
xlabel('matrix size');
ylabel('time in seconds');
legend('ch','chV','chZ','chTri','Steigungsgerade');

% Aufgabe 15 b)
% die spezialisierte Cholesky Zerlegung läuft signifikant schneller als
% alle andere Varianten. Dadurch zeigen sich die vorherigen theoretischen
% Vermutungen bestätigt, dass die Funktion mit O(n) skaliert.