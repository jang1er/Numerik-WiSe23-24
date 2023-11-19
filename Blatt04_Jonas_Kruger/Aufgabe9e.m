clearvars
clc
close all

for i=1:6
    A = AV(i)
    inversA = inversMat(A)
    inversA * A
end

function A = AV(n)
    switch(n)
        case 1
            A = [1,2;3,1];
        case 2
            A = [-11,2,2;-4,0,1;6,-1,-1];
        case 3
            A = [2,3,-1;1,2,3;3,4,-4];
        case 4
            A = [3,2;-2,-1];
        otherwise
            A = makeRegular(n);
    end
end