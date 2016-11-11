function [imgDxx, imgDxy, imgDyy] = gaussderiv2(img, sigma)
% returns the 2D second Gaussian derivatives
    D = gaussdx(-1:1,sigma);
    imgDxx = conv2(img, D, 'same');
    imgDxx = conv2(imgDxx, D, 'same');
    
    imgDxy = conv2(img, D, 'same');
    imgDxy = conv2(imgDxy, D', 'same');
    
    imgDyy = conv2(img, D', 'same');
    imgDyy = conv2(imgDyy, D', 'same');
end
