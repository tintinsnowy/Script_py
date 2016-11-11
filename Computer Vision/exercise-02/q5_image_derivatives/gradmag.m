function [imgMag, imgDir]=gradmag(img, sigma)
% insert your code here
%Create a new function gradmag that returns two images with the magnitude imgMag and orientation
% imgDir of the gradient for each pixel of the input image.
    [imgDx, imgDy] = gaussderiv(img, sigma);
    imgMag = sqrt( imgDx.^2 + imgDy.^2 );
    imgDir = atan(imgDy ./ imgDx);
end
