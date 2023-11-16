clearvars
clc
close all

% number of testcases
n = 4;

% Test solveLR
for i =1:n
    x = solveLrPivot( testA(i), testb(i));
    if(isequal(testx(i), x))
        disp('test case successfull!');
        disp(x);
    else
        disp('test case failed for:');
        disp(i);
        disp(x);
        disp('Expected:');
        disp(testx(i));
    end
end


% Test cases
function A = testA(n)
    switch (n)
        case 1
            A = [1,2,0;3,-1,4;-2,3,1];
        case 2
            A = [2,-1,1;3,1,-2;-5,2,-1];
        case 3
            A =[2,1,1;1,-1,0;1,-1,-2];
        case 4
            A = [6,-4,7;-12,5,-12;18,0,22];
        otherwise
            A = zeros(3);
    end
end

function b = testb(n)
    switch(n)
        case 1
            b = [-3;17;-5];
        case 2
            b = [-8;1;15];
        case 3 
            b = [3;1;-1];
        case 4
            b = [41/12;-22/3;29/2];
        otherwise
            b = zeros(3,1);
    end
end

function x = testx(n)
    switch (n)
        case 1 
            x = [1;-2;3];
        case 2
            x = [-2;1;-3];
        case 3
            x = [1;0;1];
        case 4 
            x = [0.5000; 0.3333; 0.2500];
        otherwise
            x = zeros(3,1);
    end
end