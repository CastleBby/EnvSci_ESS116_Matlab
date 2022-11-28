% Creates Histographs in order to compare distributions
% EarthHist_Castelan.m
% Emily Castelan Moreno May 7, 2018
% Utilizies data regarding the Earth's temperature and altitudes at both
% the midlatitudes and the equator to create histographs and compare the
% distribution

% load the data collected by aliens regarding Earth's statistical
% charcateristics
load('aliendata.mat');

% Create 4 subplot histograms of the temperature and altitudes for both
% locations. Set similar x & y limits for altitude and temp. in order to
% compare them. Utilize round & sqrt to set an appropriate number of bins
% for each data set.
subplot(2,2,1)
histogram(Tmidlat, round(sqrt(numel(Tmidlat))))
xlim([-60 0])
ylim([0 150])
title('Midlat')
xlabel('T(degrees celcius)')
ylabel('frequency')

subplot(2,2,2)
histogram(Zmidlat, round(sqrt(numel(Zmidlat))))
xlim([4800 5900])
ylim([0 150])
title('Midlat')
xlabel('Z(meters)')
ylabel('frequency')

subplot(2,2,3)
histogram(Teq, round(sqrt(numel(Teq))))
xlim([-60 0])
ylim([0 150])
title('Equator')
xlabel('T(degrees celcius)')
ylabel('frequency')

subplot(2,2,4)
histogram(Zeq, round(sqrt(numel(Zeq))))
xlim([4800 5900])
ylim([0 150])
title('Equator')
xlabel('Z(meters)')
ylabel('frequency')

% calculate the skewness of the data distributions and display the the
% value for each of the 4 distributions
fprintf('Equator Z skewness:  %05.2f\n',skewness(Zeq))
fprintf('Equator T skewness:  %05.2f\n',skewness(Teq))
fprintf('Midlat. Z skewness:  %05.2f\n',skewness(Zmidlat))
fprintf('Midlat. T skewness:  %05.2f\n',skewness(Tmidlat))

% end script