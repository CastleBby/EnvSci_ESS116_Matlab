% Detects the snow and ice covered regions of the Quelccaya Ice Cap in Peru
% compareIceCap_Castean.m
% Emily Castelan Moreno ? May 23, 2018
% Compares the total ice cap surface areas between two Quelccaya Ice Cap
% images that are 22 years apart 

% read in both images into matlab and store each in a separate matrix
iMat1988 = imread('Quelccaya_19880903.jpg');
iMat2010 = imread('Quelccaya_20100916.jpg');
% preallocate the images as matrices of white pixels
iMat1988B = ones(size(iMat1988));
iMat2010B = ones(size(iMat2010));

% for loop, loops through rows and columns, that identifies which pixels should be considered snow/ice and
% stores the pixels in the 1988B matrix
[rows, cols, z] = size(iMat1988);
count = 0;
for i = 1:rows
    for j = 1:cols
        if iMat1988(i, j, 1)<100 && iMat1988(i, j, 2)>130 && iMat1988(i, j, 3)>155 
            iMat1988B(i, j, :) = double(iMat1988(i, j, :)/255);
            count = count+1;
        end
    end 
end 
% stores the pixels in the 2010B matrix 
[rows, cols, z] = size(iMat2010);
count2 = 0;
for i = 1:rows 
    for j = 1:cols
        if iMat2010(i, j, 1)<100 && iMat2010(i, j, 2)>130 && iMat2010(i, j, 3)>155
            iMat2010B(i, j, :) = double(iMat2010(i, j, :)/255);
            count2 = count2+1;
        end 
    end 
end 

% calculate the total ice cap surface area for each image (km^2) as well as
% the total change in km^2, the rate of change, & perent change
surfaceA1998 = count*(30^2)*(10^(-6));
surfaceA2010 = count2*(30^2)*(10^(-6));
totSurfaceChange = surfaceA2010 - surfaceA1998
rateSurfaceChange = totSurfaceChange/22
perChange = totSurfaceChange/surfaceA1998

% print out the results of the calculations
fprintf('Total Ice Cap Areas\n')
fprintf('1988: %5.2f km^2\n', surfaceA1998)
fprintf('2010: %5.2f km^2\n', surfaceA2010)
fprintf('Total change:   %5.2f km^2\n', totSurfaceChange)
fprintf('Rate of change: %5.2f km^2/yr\n', rateSurfaceChange)
fprintf('Percent change: %5.2f %%\n',perChange)

% 4 figures will be created, two pairs of subplots, for a total of 2
% image windows
% the first figure should be the raw 1988 image
figure(1)
subplot(1,2,1)
imagesc(iMat1988)
title('RAW Image 1988')
axis('equal','tight')
% the second figure should show the pixels identified as snow/ice for 1988
subplot(1,2,2)
imagesc(iMat1988B)
title('Quelccaya Ice Cap Extent: 1998')
axis('equal','tight')
% the third figure should be the raw 2010 image
figure(2)
subplot(1,2,1)
imagesc(iMat2010)
title('Raw Image 2010')
axis('equal','tight')
% the fourth figure should be the pixels identified as snow/ice for 2010
subplot(1,2,2)
imagesc(iMat2010B)
title('Quelccaya Ice Cap Extent: 2010')
axis('equal','tight')

% end of script