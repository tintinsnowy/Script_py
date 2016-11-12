function imgEdge = getedges(img, sigma, theta)
% insert your code here
   % [row, col] = size(img);
    %imgEdge = zeros(row,col);
%   img = gauss(img, sigma);
    [imgMag, imgDir]=gradmag(img, sigma);
    imgEdge = (imgMag>=theta);
end
