% test the hypothesis regarding an insignificanct change in precipitation 
% fortcollins_Castelan.m
% Emily Castelan Moreno May 9, 2018
% Using a student's t-test test the hypothesis to determine whether the
% amount of precipitation per year has changed significantly 

% load the data file using textscan and account for the lines before the
% data using 'Headerlines'
fid = fopen('Fort_Collins_P.txt');
data = textscan(fid,'%d %f', 'Headerlines',8);
fclose(fid);
% separate the two elements of the cell array into two variables 
time = data{1};
precip = data{2};

% plot the amount of precipitation per year in Fort Collins 
plot(time, precip, '-b')
title('Precipitation in Fort Collins from 1896 to 2010');
xlabel('Time(years)');
ylabel('Precipitation(inches)');
xlim([1896 2010]);

% extract the data for the time intervals 1899-1939 & 1940-1980 by using
% find to index all 4 years within the interval and store each boundary
% year as a variable
pos1899 = find( time == 1899);
pos1939 = find(time == 1939);
pos1940 = find(time == 1940);
pos1980 = find(time == 1980);

% calculate the average amount of precipitation for the two time intervals
% 1899-1929 & 1940-1980 and store the values
mean1 = mean(precip(pos1899:pos1939));
mean2 = mean(precip(pos1940:pos1980));

% print the calculated means 
fprintf('Fort Collins average precipitation\n')
fprintf('1899 to 1939: %5.2f (inches)\n', mean1)
fprintf('1940 to 1980: %5.2f (inches)\n', mean2)

% create a vector d that stores the difference in precipitation between the
% 2 time intervals
d = [(precip(pos1940:pos1980))-(precip(pos1899:pos1939))];

% store the sample size as n
n = length(d);

% compute the t-statistic and store it as tstat
tstat = (mean(d)-0)/(std(d)/sqrt(n));

% compare the calculated t-test statistic to a critical value 
% set the p value to 0.05 and use tinv and store the answer as tcrit
p0 = 0.05;
tcrit = tinv(p0, (n-1));

% compare the absolute value of tcrit to tstat and print the answer to
% the screen using fprintf
fprintf('tcrit = %4.2f > tstat %4.2f the amount of precipitation has not changed significantly in Fort Collins\n', abs(tcrit),abs(tstat))

