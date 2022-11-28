% Study the distribution of the sodium data 
% sodium_Castelan.m
% Emily Castelan Moreno May 7, 2018
% Utilize the sodium data to calculate the statistical properties of the
% distribution and plot histograms

% store and load the "sodiumcontent.txt" data
Na = load('sodiumcontent.txt');
% exclude outlier from data
Na(51,:) = []

% calculate and display the sample size, sample mean, and sample median
fprintf('CENTRAL TENDENCY\n')
fprintf('Sample size:   %2.0f\n', size(Na))
fprintf('Sample mean:   %5.2f (wt%%)\n',mean(Na))
fprintf('Sample median: %5.2f (wt%%)\n\n',median(Na))
% calcuate and display the dispersion in terms of range and standard
% deviation
fprintf('DISPERSION\n')
fprintf('Range:               %4.2f (wt%%)\n',range(Na))
fprintf('Standard deviation:  %4.2f (wt%%)\n\n',std(Na))
% calculate and display the distribution's shape in terms of skewness and
% kurtosis
fprintf('DISTRIBUTION''S SHAPE\n')
fprintf('Skewness: %4.2f\n',skewness(Na))
fprintf('Kurtosis: %4.f\n', kurtosis(Na))
% histogram that uses round and sqrt to set the appropriate amount of bins
histogram(Na, round(sqrt(numel(Na))))
xlabel('Na(wt%%)')
title('Distribution of Sodium')

% end script
