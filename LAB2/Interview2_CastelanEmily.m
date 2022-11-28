%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This code intentionally contains several errors. 
%replace all XXX with the correct value
%!!!NOTE: Read code comments carefully to understand the purpose 
%!!!    of each piece of code.   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Open file and check that it has been found
filepath = '/Users/EmCast/Desktop/Lab 2/co2_mm_mlo.txt';
fid = fopen(filepath);
if(fid==-1),
    error(['could not open file, make sure that the path provided (' filepath ') is correct']);
end

%extract data using textscan, there are 7 columns, with numbers in each
%column, and the header is 72 lines long
headerlength = 72;
data = textscan(fid,'%f %f %f %f %f %f %f','Headerlines',headerlength);

%We are done reading the file, we can now close it
fclose(fid);

%Extract the columns that we are interested in here: time and CO2
%concentration
time = data{3};
co2  = data{4};

%Filter out empty values (the header says that -99.99 means "missing data")
%Find where we have -99.99
pos = find(co2==-99.99);
%replace them by NaN
co2(pos)= NaN;

%plot co2 as a function of time as a red line
plot(time,co2,'-r');

%Title and axis labels (with units)
title('Mauna Lao CO_2 Monthly Mean from 1958-2016');
xlabel('time (years)');
ylabel('CO_2 (ppm)');

%restrict x values to 1958 - 2016
xlim([1958, 2016]);

%print figure and attach to Lab report
