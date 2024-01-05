clearvars
clc
close all

n = 200;
f = @(x) atan(x);
df = @(x) 1/(x^2+1);

% generate random start values
x0 = linspace(-10, 10, n)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Newton Verfahren
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iterations = zeros(n,1);
for i=1:n
    xk = newtonSkalar(f, df, x0(i), 1e-10, 200);
    if(sum(isnan(xk)) > 0)
        iterations(i) = -size(xk,1)/3;
    else
        iterations(i) = size(xk,1)/3;
    end
end

figure(1)
hold on;
% draw convergence section
drawBounds(x0, iterations);

%rectangle('Position',[x0(1) 0 (x0(end) - x0(1)) max(iterations)],'EdgeColor','r','LineStyle','--')
for i=1:size(iterations,1);
    if(iterations(i) >= 0)
        scatter(x0(i),iterations(i),25,'blue','filled')
    else
        scatter(x0(i),abs(iterations(i)),15,'red')
    end
end
hold off;
xlim([-10 10]);
title('Newton Verfahren');

% d)
x = 1.3917452002707349244;
xk = newtonSkalar(f, df, x, 1e-10, 600);
disp('iterations for x: Max Iteration = 600')
disp(size(xk,1)/3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Sekanten Verfahren
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% e)
x0 = linspace(-10,10,n)';
x1 = zeros(n,1);
for i=1:n
    if(x0(i) >= 0)
        x1(i) = -5;
    else
        x1(i) = 5;
    end
end

iterations = zeros(n,1);
for i=1:n
    xk = sekanten(f, x0(i),x1(i), 1e-10, 200);
    if(sum(isnan(xk)) > 0)
        iterations(i) = -size(xk,1)/3;
    else
        iterations(i) = size(xk,1)/3;
    end
end
figure(2)
hold on;
% draw convergence section
drawBounds(x0, iterations);
for i=1:size(iterations,1);
    if(iterations(i) >= 0)
        scatter(x0(i),iterations(i),25,'blue','filled')
    else
        scatter(x0(i),abs(iterations(i)),15,'red')
    end
end
hold off;
xlim([-10 10]);
title('Sekanten Verfahren')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Sekanten Verfahren Vertauscht
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f)
iterations = zeros(n,1);
for i=1:n
    xk = sekanten(f, x1(i),x0(i), 1e-10, 200);
    if(sum(isnan(xk)) > 0)
        iterations(i) = -size(xk,1)/3;
    else
        iterations(i) = size(xk,1)/3;
    end
end
figure(3)
hold on;
% draw convergence section
drawBounds(x0, iterations);
for i=1:size(iterations,1);
    if(iterations(i) >= 0)
        scatter(x0(i),iterations(i),25,'blue','filled')
    else
        scatter(x0(i),abs(iterations(i)),15,'red')
    end
end
hold off;
xlim([-10 10]);
title('Sekanten Verfahren vertauscht')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Decker Verfahren
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i)
iterations = zeros(n,1);
for i=1:n
    xk = dekker(f, x0(i),x1(i), 1e-10, 200);
    if(sum(isnan(xk)) > 0)
        iterations(i) = -size(xk,1)/3;
    else
        iterations(i) = size(xk,1)/3;
    end
end
figure(4)
hold on;
% draw convergence section
drawBounds(x0, iterations);
for i=1:size(iterations,1);
    if(iterations(i) >= 0)
        scatter(x0(i),iterations(i),25,'blue','filled')
    else
        scatter(x0(i),abs(iterations(i)),15,'red')
    end
end
hold off;
xlim([-10 10]);
title('Dekker Verfahren')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Decker Verfahren Vertauscht
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% i)
iterations = zeros(n,1);
for i=1:n
    xk = dekker(f, x1(i),x0(i), 1e-10, 200);
    if(sum(isnan(xk)) > 0)
        iterations(i) = -1;
    else
        iterations(i) = size(xk,1)/3;
    end
end
figure(5)
hold on;
% draw convergence section
drawBounds(x0, iterations);
for i=1:size(iterations,1);
    if(iterations(i) >= 0)
        scatter(x0(i),iterations(i),25,'blue','filled')
    else
        scatter(x0(i),abs(iterations(i)),15,'red')
    end
end
hold off;
xlim([-10 10]);
title('Dekker Verfahren vertauscht')



% wtf is this
function drawBounds(x0, iterations)
index = 1;
temp = 1;
searching = false;
while temp <= size(iterations,1) % stay inside array
   if temp >= size(iterations,1) && iterations(temp) > 0 % draw if end of array is reached and valid
        if temp - index > 1 rectangle('Position',[x0(index) 0 (x0(temp) - x0(index)) max(iterations)],'EdgeColor','r','LineStyle','--') ,end;
        index = temp+1;
        break;
   end
   if(iterations(temp) < 0) % draw bounds if invalid point found
        if (temp - index > 1 && ~searching) rectangle('Position',[x0(index) 0 (x0(temp-1) - x0(index)) max(iterations)],'EdgeColor','r','LineStyle','--') ,end;
        searching = true;
   else % set index to valid point and search for bounds
        if(searching)
            index = temp;
            searching = false;
        end
   end
   temp = temp + 1;
end
end