function [imgDx, imgDy] = gaussderiv(img, sigma)
% insert your code here
    derivative_x = gaussdx(-1:1, sigma);
    imgDx = conv2(img, derivative_x, 'same');
    derivative_y = gaussdx(-1:1, sigma);
    imgDy = conv2(img, derivative_y', 'same');    

end
