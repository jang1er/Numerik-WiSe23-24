close all
clearvars
clc

n = 2.^(3:10);
timeZP = zeros(size(n,2),1);
timeVP = zeros(size(n,2),1);
timeSP = zeros(size(n,2),1);
timeZT = zeros(size(n,2),1);
timeVT = zeros(size(n,2),1);
for i=1:size(n,2)
    A = makeRegular(n(i));
    tic
    lrPivotZP(A);
    timeZP(i) = toc;

    tic
    lrPivotVP(A);
    timeVP(i) = toc;

    tic 
    lrPivotSP(A);
    timeSP(i) = toc;

    tic
    lrPivotZT(A);
    timeZT(i) = toc;

    tic
    lrPivotVT(A);
    timeVT(i) = toc;
end
figure(1);
hold on;
loglog(n, timeZP);
loglog(n, timeVP);
loglog(n, timeSP);
loglog(n, timeZT);
loglog(n, timeVT);
hold off;
xlabel('matrix size');
ylabel('time in seconds');
legend('ZP','VP','SP','ZT','VT');