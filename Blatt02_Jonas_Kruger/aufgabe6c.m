clearvars
clc
close all

n = power(2,6:15);              
time_v1 = zeros(size(n,2),1);
time_v2 = zeros(size(n,2),1);
time_v1_vec = zeros(size(n,2),1);
time_v2_vec = zeros(size(n,2),1);

for i=1:size(n,2)
    L = makeMatrix(n(i));   % generate random n*n-Matrix
    b = rand(n(i),1); % generate random n-dimensional vektor

    tic; % start stop watch
    Linvb(L , b);   % solve with Linvb
    time_v1(i) = toc;

    tic; % start stop watch
    Linvb2(L , b);   % solve with Linvb2
    time_v2(i) = toc;

    tic; % start stop watch
    Linvb_Vec(L , b);   % solve with Linvb_Vec
    time_v1_vec(i) = toc;

    tic; % start stop watch
    Linvb2_Vec(L , b);   % solve with Linvb2_Vec
    time_v2_vec(i) = toc;
end

figure(1);
hold on;
plot(n, time_v1, 'r'); % plot time for Linvb
plot(n, time_v2, 'b'); % plot time for Linvb2
plot(n, time_v1_vec, 'g'); % plot time for Linvb_Vec Aufgabe e)
plot(n, time_v2_vec, 'y'); % plot time for Linvb2_Vec   Aufgabr e)
xlabel('Matrix size');
ylabel('Time in seconds');

% Aufgabe 6 f)
% Linvb2 läuft deutlisch schneller als Linvb -> x-Variable ändert im
% inneren Loop nicht, höhere Cache-Hit Rate
%
% Warum die Vektorisierte Variante scheiße läuft keine Ahnung????
