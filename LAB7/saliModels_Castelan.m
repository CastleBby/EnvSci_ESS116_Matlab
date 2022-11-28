% Uses data sets to create empirical models regarding salinity in 3 parts
% saliModels_Castelan.m
% Emily Castelan Moreno May 16th, 2018
% part 1 creates a linear model for the first data set then part 2 creates a
% linear model for the second set of data and tests the model's predictive
% skill and finally part 3 fits a quadratic model to each data set then
% both

%% Part 1: build linear empirical model 

% load the data trainingdata_below_1200m.mat but do not save it into a
% variable in order to be able to access the data's variables
load('trainingdata_below_1200m.mat');

% plot the data and provide the approrpiate labels as well as number of
% ticks (which must be specified as an array) and fontsize
figure(1)
plot(depth_m_sample1,salinity_psu_sample1,'k.','Marker','o')
title('Moored profiler data at 36N, 146E (June 8-13, 2004)')
xlabel('Depth(m)')
ylabel('Salinity(psu)')
xlim([900, 1450])
ylim([34.35, 34.55])
set(gca, 'XTick',900:100:1500,'YTick',34.35:.05:34.55,'fontsize', 18); 
hold on

% Use polyfit to calculate the best-fit line to the data plotted 
order = 1; 
p = polyfit(depth_m_sample1,salinity_psu_sample1,order);
% new set of x values that extends throughout the whole range of the plot
xext = linspace(900,1450,1000);
% create a new set of y values that fits both the data and exteneded x set
y = polyval(p,xext);
plot(xext,y,'b','LineStyle','--','LineWidth',2)

% include salinity predictions in the plot 
% save a new y variable which is the salinity prediction based on the data
% and model
salty = polyval(p,depth_m_sample1);
plot(depth_m_sample1,salty,'bx')

% create a legend in the northwest corner of the plot
legend({'Training Data (days1-5)','Linear Model', 'Model predictions of training data (R^2=0.9572)'},'Location','northwest','Fontsize',12)

% Measure the goodness of the fit by calculating R^2
% we are comparing the actual salinity values to the modeled salinity
% values
R = corrcoef(salty,salinity_psu_sample1);
Rsq = R(2)^2;

% find what the model predicts the salinity is at 1000 m
x1000m = polyval(p,1000);

% end of Part 1

%% Part 2: test linear model predictive skill

%load the new data which measures the salinity from 1000-12000 m
load('testdata_1000m_to_1200m.mat');

% create a new figure which plots the combined the new data which ranges from 1000m to
% 12000 m to the previous plot as well as the linear empirical model
figure(2)
plot(depth_m_sample1,salinity_psu_sample1,'k.','Marker','o')
title('Moored profiler data at 36N, 146E (June 8-13, 2004)')
xlabel('Depth(m)')
ylabel('Salinity(psu)')
xlim([900, 1450])
ylim([34.35, 34.55])
set(gca, 'XTick',900:100:1500,'YTick',34.35:.05:34.55,'fontsize', 18); 
hold on
plot(depth_m_sample2,salinity_psu_sample2,'m.','Marker','o')
hold on 
% Use polyfit to calculate the best-fit line to the data plotted 
p = polyfit(depth_m_sample1,salinity_psu_sample1,order);
% new set of x values that extends throughout the whole range of the plot
xext = linspace(900,1450,1000);
% create a new set of y values that fits both the data and exteneded x set
y = polyval(p,xext);
plot(xext,y,'b','LineStyle','--','LineWidth',2)

% include salinity predictions in the plot 
% save a new y variable which is the salinity prediction based on the data
% and model
salty = polyval(p,depth_m_sample1);
plot(depth_m_sample1,salty,'bx')

% plot salinity predictions as blue "x's" falling on the blue dashed line
% that correlate to the new data
salty2 = polyval(p, depth_m_sample2);
plot(depth_m_sample2, salty2, 'bx')

% create a new legend
legend({'Training Data (days 1-5)','Test Data', 'Linear Model', 'Model predictions of the test data (R^2=0.9723)'},'Location','northwest','FontSize',12)

% assess the goodness fit by calculating R^2
R = corrcoef(salty2, salinity_psu_sample2);
Rsq = R(2)^2;

% end of part 2

%% Part 3: build a quadratic empirical model & compare its predictive skill to the linear model 

% create new variables that span both data sets  
combdepth = [depth_m_sample1, depth_m_sample2];
combsalinity = [salinity_psu_sample1, salinity_psu_sample2];

% create a new figure which uses polyfit to find the best-fit quadrative relationship to both the
% original and new data
figure (3);
order = 2;
p2 = polyfit(combdepth, combsalinity, order);
% now plot the original data
plot(depth_m_sample1,salinity_psu_sample1,'k.','Marker','o')
title('Moored profiler data at 36N, 146E (June 8-13, 2004)')
xlabel('Depth(m)')
ylabel('Salinity(psu)')
xlim([900, 1450])
ylim([34.35, 34.55])
set(gca, 'XTick',900:100:1500,'YTick',34.35:.05:34.55,'fontsize', 18);
hold on
% plot the quadratic
yfit = polyval(p2,xext);
plot(xext,yfit, 'b','LineStyle','--','LineWidth',2)

% create a new figure that plots the quadratic model on top of both the
% data sets
figure (4)
order = 2;
p2 = polyfit(combdepth, combsalinity, order);
% now plot the original data set
plot(depth_m_sample1,salinity_psu_sample1,'k.','Marker','o')
title('Moored profiler data at 36N, 146E (June 8-13, 2004)')
xlabel('Depth(m)')
ylabel('Salinity(psu)')
xlim([900, 1450])
ylim([34.35, 34.55])
set(gca, 'XTick',900:100:1500,'YTick',34.35:.05:34.55,'fontsize', 18);
hold on
% plot the quadratic
yfit = polyval(p2,xext);
plot(xext,yfit, 'b','LineStyle','--','LineWidth',2)
hold on 
% plot the second data set
plot(depth_m_sample2,salinity_psu_sample2,'m.','Marker','o')

% extrapolate the salinity values into the unsampled 900m - 1000m depth
% regime at 10 m depth intervals and list it as a table
x9to10 = linspace(900,1000,11);
yfit2 = polyval(p2, x9to10)
% list the results in a table
fprintf('Depth          %3.0d     %3.0d     %3.0d     %3.0d     %3.0d     %3.0d\n', x9to10(1:6))
fprintf('Prediction %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f\n', yfit2([1:6]))
fprintf('Depth          %3.0d     %3.0d     %3.0d     %3.0d   %4.0d\n',  x9to10([7:11]))
fprintf('Prediction %7.4f %7.4f %7.4f %7.4f %7.4f \n', yfit2([6:10]))