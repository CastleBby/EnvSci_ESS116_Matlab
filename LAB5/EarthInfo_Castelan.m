% Displays the statistical characteristics of Earth measured by aliens
% EarthInfo_Castelan.m
% Emily Castelan Moreno May 7, 2018
% Displays the location and dispersion characteristics of Earth based on the 'aliendata.mat' file

% load the data in order to display the values, utilize whos to see the 5
% variables that are being stored 
load('aliendata.mat');

% display the calcualted mean and standard deviation for both temperature and altitude
% of Earth measure at midlatitude based on the data
fprintf('Earth Properties @ Midlatitude\n')
fprintf('Mean Temperature:     %5.2f °C\n', mean(Tmidlat))
fprintf('Mean Altitude:       %7.2f meters\n', mean(Zmidlat))
fprintf('Std Dev Temperature:    %4.2f °C\n', std(Tmidlat))
fprintf('Std Dev Altitude:     %6.2f meters\n\n', std(Zmidlat))

% display the calculated mean and standard deviation for both temperature and altitude
% of Earth measure at the Equator based on the data
fprintf('Earth Properties @ Equator\n')
fprintf('Mean Temperature:      %4.2f °C\n', mean(Teq))
fprintf('Mean Altitude:       %7.2f meters\n', mean(Zeq))
fprintf('Std Dev Temperature:    %4.2f °C\n', std(Teq))
fprintf('Std Dev Altitude:      %5.2f meters\n', std(Zeq))

% end script