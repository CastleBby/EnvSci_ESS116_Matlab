% Recreates the Ireland flag & then 2 identical 6-pixel images
% makeImage_Castelan.m
% Emily Castelan Moreno ? May 23, 2018
% Utilizes true color RGB indexing to recreate the Ireland flag and then
% recreates 2 identical 6-pixel images using 2 different methods

% Utilize RGB indexing to recreate the Ireland flag as a matrix by specificing the
% color of each block of the flag from left to right
figure(1)

Ire(:,:,1) = [0 1 1];
Ire(:,:,2) = [1 1 .733];
Ire(:,:,3) = [0 1 0];
title('Indexed Color Image')
axis('equal','tight')

% Use the image command to plot the matrix created above as an image
image(Ire)

% The next figure window should combine the two images using subplot
% Create a 6-pixel matrix utilizing indexing and "cmap", and specificy the
% appropriate colormap & title
figure(2)
subplot(1,2,1)

iMat = [1, 2; 3, 4; 5, 6]
cMap = [0 0 1; 0 1 0; 1 1 0; 1 0 1; 0.78 0.78 0.78; 0 1 1]
colormap(cMap);
image(iMat);
title('Indexed Color Image')
axis('equal','tight')

% Create a new image, but it will be placed within the same window as
% figure (2) 
% Create the same 6-pixel matrix utiziling true color (RGB)
subplot(1,2,2)

pixRGB(:,:,1) = [0 0; 1 1; 0.78 0];
pixRGB(:,:,2) = [0 1; 1 0; 0.78 1];
pixRGB(:,:,3) = [1 0; 0 1; 0.78 1];
image(pixRGB)
title('True Color Image')
axis('equal','tight')

% end of script