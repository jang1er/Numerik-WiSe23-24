function printMatrix(matrix)
[mrows, mcols] = size(matrix);
outputstr = ['%' num2str(mrows) 'i   '];
template = ['%' num2str(mrows) 'i   ']; % template for the string, you put your datatype here
outputstr = template;
for i = 2:mcols
    outputstr = [outputstr template];
end
outputstr = [outputstr '\n']; % add a new line if you want
fprintf(outputstr, matrix.'); % write it