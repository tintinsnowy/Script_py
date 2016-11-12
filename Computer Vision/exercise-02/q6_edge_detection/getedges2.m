function imgEdge = getedges2(img, sigma, theta)
% insert your code here
    [imgMag, imgDir]=gradmag(img, sigma);
    imgDir =(isnan(imgDir) ~= 1);
    imgMax = nonmaxsupcanny(imgMag,imgDir);
    imgEdge = (imgMag>=theta); 
end
