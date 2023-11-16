clear x y f
[x y] = meshgrid(linspace(-2,2),linspace(-2,2)); % create 2-D mesh used for plot
A = rand(2,2); % random 2x2 Matrix
b = rand(2,1); % random 2x1 Vektor
c = rand; % random skalar
f = zeros(size(x,1));
for i=1:size(x,2)   % loop through first dimension
    for j=1:size(y,2)   % loop through second dimension
        f(i,j) = quadpoly([x(i,j);y(i,j)]... build vector from x and y mesh-array
            , A, b, c); % last arguements for function
    end
end

figure(2)
surf(x,y,f) % plot graph from [-2.2] in 2 Dimensions