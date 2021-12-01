%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author      : LPGG
% Date        : Dec/01/2021
% Description : Get the average number of errors
% Notes       :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A1=importdata('result.txt');

errorPulses=A1(:,3);
[r,c] = size(A1);

averageError = sum(errorPulses)/r;

formatSpec = 'The average error in %d FIR operations is %2.2f\n';
display('/////////////////////////////////////////////////////')
fprintf(formatSpec,r,averageError);
display('/////////////////////////////////////////////////////')

