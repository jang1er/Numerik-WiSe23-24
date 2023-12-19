clear x A b c y
x = linspace(-2, 2); % define interval for function
A = rand*10-5; % random Value from -5 to 5
b = rand; % random Value
c = rand; % random Value
for i = 1:size(x,2) % iterate through vector
    y(i) = quadpoly(x(i)... % get x-value from intervall vector
        ,A,b,c); % calc. y-value for specific x-value in vector
end

figure(1);
plot(x,y); 