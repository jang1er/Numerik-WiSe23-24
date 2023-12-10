clearvars
close all
clc

% d)
A =[1,1;1,2;1,2;1,5];
b = [2;2;4;6];

[Q1,Q2, R] = qr_HouseholderThin(A);
n = size(A,2);
R = R(1:n,1:n);
b = Q1'*b;
x = Rinvb2(R,b);
disp(x);

% e)
clearvars
clc
close all

% define Matrix A
A =[1,0,1;1,sqrt(3)/2,1/2;1,sqrt(3)/2,-1/2;1,0,-1;1,-sqrt(3)/2,-1/2;1,-sqrt(3)/2,1/2];%
% define vector b
b = [19/10;3;13/5;11/10;2/5;3/2];

% define t
t = (0:5) .* 2;

% define y
y = eye(size(t,2),1);

% compute solution (matlab already minimizes the problem)
x = A \ b;
disp('Matlab:')
disp(x);
for i=1:size(t,2)
    y(i) = h(t(i),x);
end

x_ = linspace(0,10,100);

figure(1);
hold on;
plot(x_, h(x_,x));
scatter(t, b);

% plot error from function values to real values
for i=1:size(t,2)
    plot ([t(i) t(i)], [y(i) b(i)], 'r');
end

hold off;
xlabel('Stunden');
ylabel('Wasserhöhe in Meter');
legend('solution', 'actual data', 'error');

% calculate minimal error sum
e = A*x -b;
errorSum = sum(e.^2);

[Q1,Q2, R] = qr_HouseholderThin(A);
n = size(A,2);
R = R(1:n,1:n);
b = Q1'*b;
x = Rinvb2(R,b);
disp('QR Householder Thin:')
disp(x);


function y = h(t,x)
    y = x(1) + x(2) * sin(pi*t/6) + x(3) * cos(pi*t/6);
end
