function [px, py] = hessian(img, sigma, thresh)

	[imgDxx, imgDxy, imgDyy] = gaussderiv2(img, sigma);

	imgHesdet = sigma^4 * (imgDxx .* imgDyy - imgDxy.^2);
	imgPts = nonmaxsup2d(imgHesdet);
	  			
	[py, px] = find(imgPts > thresh);

end
