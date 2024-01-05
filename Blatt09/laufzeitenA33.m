close all
clearvars
clc

i = 3:10;
n = 2.^i;

timeGivens = zeros(size(i,2),1);
timeHouse = zeros(size(i,2),1);
timeUpdate = zeros(size(i,2),1);

for j = 1:size(i,2)
    disp(['iteration: ',num2str(j)])
    m = 1.5 * n(j);
    A = rand(m,n(j)); % make matrix A
    u = rand(m,1);
    v = rand(n(j),1);

    An = A + u * v';
    
    % time test givens
    tic;
    [Q,R] = qr_Givens(A);
    timeGivens(j) = toc;


    % time test householder
    tic;
    [~,~] = qr_Householder(A);
    timeHouse(j) = toc;

    %time test update
    tic;
    [~,~] = myQrUpdateRank1(Q,R,u,v);
    timeUpdate(j) = toc;
end

set(gca, 'YScale','log');
set(gca, 'XScale','log');
hold on;
loglog(n, timeGivens);
loglog(n, timeHouse);
loglog(n, timeUpdate);
loglog([n(1) n(end)], [min(timeGivens) timeGivens(end)],"--")
loglog([n(1) n(end)], [min(timeHouse) timeHouse(end)],"--")
loglog([n(1) n(end)], [min(timeUpdate) timeUpdate(end)],"--")
hold off;
legend('Givens','Householder','Rank1-Update','Steigung Givens','Steigung Householder','Steigung QrUpdate')