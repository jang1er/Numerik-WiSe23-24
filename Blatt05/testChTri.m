clearvars
clc
close all

% test choleskyTriDiag

for i=4:10
    T = diag(1:i) + diag(i-1:-1:1,-1);
    A = T * T';
    L = choleskyTriDiag(A);

    if(isequal(T,L))
        disp('test succesfull');
    else
        disp('test failed for:');
        disp(A);
        disp(T);
        disp(L);
    end
end