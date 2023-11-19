clearvars
clc
close all

% Testfall 1 
L = [1,0,0 ; 2,1,0 ; 1,2,1];
b = [1;4;8];

x = Linvb(L, b) % erwartetes Ergebnis [1;2;3]
x = Linvb2(L, b) % gleiches Ergenis erwartet
x = Linvb_Vec(L, b)
% Testfall 2 
L = [1,0,0 ; -2,1,0; 0,1.5,1];
b = [1;-4;1];

x = Linvb(L, b) % erwartetes Ergebnis [1;-2;4]
x = Linvb2(L, b) % gleiches Ergebnis erwartet
x = Linvb2_Vec(L ,b)