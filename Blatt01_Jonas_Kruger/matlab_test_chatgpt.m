
function MyProgram()    % to fix error -> all statements need to be inside of a function
% Generate a random 3x3 matrix
matrix = rand(3, 3);

% Call the calculateMean function
meanValue = calculateMean(matrix);

% Set a threshold value
threshold = 0.5;

% Check if the mean is greater than the threshold
if meanValue > threshold
    disp('The mean is greater than the threshold.');
else
    disp('The mean is not greater than the threshold.');
end

% Display the matrix and the calculated mean
disp('Matrix:');
disp(matrix);
disp(['Mean: ' num2str(meanValue)]);
end

% Define a function to calculate the mean of a matrix
function meanValue = calculateMean(matrix)
    meanValue = mean(matrix(:));
end

% Das Skript berechnet den Durchschnittswert aller Elemente der Matrix
% 1. Zuerst wird eine zufällige 3x3 Matrix erstellt
% 2. dann wird die Funktion zur Berechnung aufgerufen
% 3. Dort wird die Matrix durch matrix(:) in das Format eines
% ein-dimensionalem Arrays gebracht
% 4. Dann wird mit der "mean"-Methode der Durchschnitt berechnet und
% zurückgegeben
% 5. Der Durchschnitt wird mit einem Threshold verglichen und es gibt eine
% Ausgabe, ob dieser unter oder über der Grenze liegt
% 6. Zuletzt wird die Matrix und der Durchschnitt in der Konsole
% ausgegeben

