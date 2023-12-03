clearvars
clc
close all

% define Matrix A
A =[1,0,1;1,sqrt(3)/2,1/2;1,sqrt(3)/2,-1/2;1,0,1;1,-1,0;1,-sqrt(3)/2,1/2];

% define vector b
b = [19/10;3;13/5;11/10;2/5;3/2];

% define t
t = (0:5) .* 2;

% define y
y = eye(size(t,2),1);

% compute solution (matlab already minimizes the problem)
x = A \ b;

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
disp(errorSum);

disp('formula is');
fprintf('h(t) = %f + %f * sin(2pi*t/12) + %f * cos(2pi*t/12)\n', x);

function y = h(t,x)
    y = x(1) + x(2) * sin(pi*t/6) + x(3) * cos(pi*t/6);
end