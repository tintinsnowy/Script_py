function [imgMag, imgDir]=gradmag(img, sigma)
% insert your code here
  [imgDx, imgDy] = gaussderiv(img, sigma);
  imgMag = sqrt(imgDx.^2+imgDy.^2);
  imgDir = atan(imgDy./imgDx);
end
