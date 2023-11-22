close all
clearvars
clc

n = 2.^(3:11);
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
figure(1);
hold on;
loglog(n, timeCH);
loglog(n, timeCHV);
loglog(n, timeCHZ);
loglog(n, timeCHTRI);
hold off;
xlabel('matrix size');
ylabel('time in seconds');
legend('ch','chV','chZ','chTri');

%disp(mean(timeCH(end) - timeCH(1), timeCHV(end) - timeCHV(1), timeCHZ(end) - timeCHZ(1), timeCHTRI(end) - timeCHTRI(1)));