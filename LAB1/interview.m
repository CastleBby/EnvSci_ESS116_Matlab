%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This code intentionally contains several errors. 
%Try to correct (debug) the code by investigating the error message
%   printed in the command window and referring to matlab help. 
%!!!NOTE: Read code comments carefully to understand the purpose 
%!!!    of each piece of code.   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Section 1
% We want to calculate and display the area of a circle with a radius 10 m;

%Define radius
radius = 10;

%Compute total area
total_area = pi*radius^2;

%Display total area:
disp(['The total area of a circle of radius ' num2str(radius) ' is ' num2str(total_area)]);

%Section 2
%We have two samples of Earth density measurements and would like to compare their mean

%List of densities in g/cm^3
densities1 = [5.29 5.44 5.34 5.79 5.10 5.27 5.39 5.42 5.47 5.63 5.34 5.46 5.30 5.75 5.68 5.85];
densities2 = [5.44 5.34 5.34 5.79 5.10 5.27 5.39 5.42 5.47 5.63 5.34 5.46 5.30 5.75 5.68 5.85];

%Compute mean for sample 1
meanD1 = mean(densities1);
disp(['The mean of the first  sample is ' num2str(meanD1) ' g/cm^3']);

%Compute mean for sample 2
meanD2 = mean(densities2);
disp(['The mean of the second sample is ' num2str(meanD2) ' g/cm^3']);
