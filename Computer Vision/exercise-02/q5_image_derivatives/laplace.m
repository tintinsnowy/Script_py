function imgLap=laplace(img, sigma)
% insert your code here
    [imgDxx, imgDxy, imgDyy] = gaussderiv2(img, sigma);
    imgLap = imgDxx+imgDyy;
end
