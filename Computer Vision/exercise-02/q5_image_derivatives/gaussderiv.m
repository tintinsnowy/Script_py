function [imgDx, imgDy] = gaussderiv(img, sigma)
% insert your code here
    derivative_x = gaussdx(-3*sigma:3*sigma, sigma);
    imgDx = conv2(img, derivative_x, 'same');
    derivative_y = gaussdx(-3*sigma:3*sigma, sigma);
    imgDy = conv2(img, derivative_y', 'same');    
end
