clearvars
clc
close all

% number of testcases
cases = 3;
format1 = 'Residium (b-Ax) :\n %e \n %e \n %e \n';

% Test solveLR
for i =1:cases
    n = size(testA(i),1);
    x = solveLR( testA(i), testb(i));
    r = testb(i) - testA(i) * x;
    disp('#######################################');
    disp('Referenzlösung:');
    disp(testA(i)\testb(i));

    % Print values for solveLR
    disp('###   Ohne Pivotisierung:');
    disp(x);
    fprintf(format1,r);
    disp('');

    % Calculate values for solveLrPivot
    x2 = solveLrPivot(testA(i), testb(i));
    r2 = testb(i) - testA(i) * x2;

    % Print values for solveLrPivot
    disp('###   Mit Pivotisierung:');
    disp(x2);
    fprintf(format1,r2);
    disp('');

    % Display L and R-Matrix for both variants
    A = kompaktLR(testA(i));
    disp('');
    disp('L und R ohne Pivotisierung');
    printMatrix(tril(A,-1)+ eye(n));
    disp('-----------------------');
    printMatrix(triu(A));
    A = lrPivotZP(testA(i));
    disp('L und R mit Pivotisierung');
    printMatrix(tril(A,-1)+ eye(n));
    disp('-----------------------');
    printMatrix(triu(A));

end


% Test cases
function A = testA(n)
    switch (n)
        case 1
            A = [0,1;1,1];
        case 2
            A = [11,44,1;0.1,0.4,3;0,1,-1];
        case 3
            A =[0.001,1,1;-1,0.004,0.004;-1000,0.004,0.000004];
        otherwise
            A = zeros(3);
    end
end

function b = testb(n)
    switch(n)
        case 1
            b = [1;1];
        case 2
            b = [1;1;1];
        case 3 
            b = [1;1;1];
        otherwise
            b = zeros(3,1);
    end
end