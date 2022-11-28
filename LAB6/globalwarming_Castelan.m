% tests whether is the change in the mean temperature is due to global
% warming
% globalwarming_Castelan.m
% Emily Castelan Moreno May 9, 2018
% Utilize a t-stat to determine whether mean change in temperature is due
% to internal variability 

% load the data into the script 
load('surface_temperature_10daily.mat');

% load the coastline data into the script
load('coastlines.mat');

% define and store 4 variables that will be used to define 2 time intervals
recent_year1 = 2000;
recent_year2 = 2010;
control_year1 = 1980;
control_year2 = 1990;

% test sample(recent climate): 
indices_time_recent = find (year >= recent_year1 & year <= recent_year2);
temp_recent = temperature(:,:,indices_time_recent);

% control sample (historic climate)
indices_time_historic = find (year >= control_year1 & year <= control_year2);
temp_past = temperature (:,:, indices_time_historic);

% calculate the mean temperature between the two time intervals 
difference_in_means = mean(temp_recent,3) - mean(temp_past,3);

% display the map and plot the first subplot of the difference between the
% 2 time intervals 
% add the coast lines to the image and include the appropriate labels and titles 
subplot(2,1,1)
imagesc(lon, lat, difference_in_means)
axis xy
colormap([1 1 1;jet]);
colorbar
caxis([-4 4]);
hold on 
plot(coastlon, coastlat, '-k');
title('Difference 2000-2010) minus (1980-1990) in temperature (°C)');
xlabel('latitiude(degrees)');
ylabel('longitude(degrees)');

% calculate the critical value and save it as tcrit
n = length(indices_time_historic);
p0 = .025;
tcrit = tinv(p0, (n-1));

% store a matrix 
difference_in_means95sig = NaN(length(lat),length(lon));

% perform a t-test on each pixel of the map at a 95% confidence level 
for i = 1:length(lat);
    for j = 1:length(lon);
        d = (temp_recent(i,j,:) - temp_past(i,j,:));
        tstat = (mean(d)-0)/(std(d)/sqrt(n));
        if tstat>tcrit
            difference_in_means95sig(i,j) = mean(d);
            end
        end
end

% create the second subplot which displays the difference_in_means95sig
% thereby masking the regions where the change in the mean temperature is
% not significant
subplot(2,1,2)
imagesc(lon, lat, difference_in_means95sig);
axis xy
colormap([1 1 1;jet]);
colorbar
caxis([-4 4]);
hold on 
plot(coastlon, coastlat, '-k');
title('95% significant only');
xlabel('latitiude(degrees)');
ylabel('longitude(degrees)');

% end of script