clear t p nst_values nstStabil_values rel_error
clearvars
clc
close all


q = 1;
t = 0:0.1:12; % interval for t
p = 10.^t;  % calc values for p
n = size(t,2);  % size of interval t
nst_values = zeros(n,2);    % pre allocate array for nst-values
nstStabil_values = zeros(n,2); % pre allocate array for nstStabil-values
rel_error1 = zeros(n,1); % pre allocate array for error-values of x1
rel_error2 = zeros(n,1); % pre allocate array for error-values of x2

for i=1:n   % first loop for p > 0
    nst_values(i,:) = nst(p(i),q);  % values of nst
    nstStabil_values(i,:) = nstStabil(p(i),q);  % values of nstStabil
    rel_error1(i) = relativeError(nst_values(i,1), nstStabil_values(i,1));  % compute relative error
    rel_error2(i) = relativeError(nst_values(i,2), nstStabil_values(i,2));  % compute relative error
end

figure(1)
hold on;
loglog(p, rel_error1, 'b'); % plot error of x1
loglog(p, rel_error2, 'r'); % plot error of x2
title("Relative error for 10^t");   % set title for graph
hold off;
p = -(10.^t);   % compute values of p
for i=1:n   % second loop for p < 0
    nst_values(i,:) = nst(p(i),q);  % values of nst
    nstStabil_values(i,:) = nstStabil(p(i),q);  % values of nstStabil
    rel_error1(i) = relativeError(nst_values(i,1), nstStabil_values(i,1));  % compute relative error
    rel_error2(i) = relativeError(nst_values(i,2), nstStabil_values(i,2));  % compute relative error
end

figure(3)   % plot values for p < 0
hold on;
loglog(abs(p), rel_error1, 'b');
loglog(abs(p), rel_error2, 'r');
title("Relative error for -10^t");
hold off;

