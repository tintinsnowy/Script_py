function [px, py] = hessian(img, sigma, thresh)
	% 
   [xx,xy,yy] = gaussderiv2(img,sigma);
   heset = sigma^4*(xx.*yy-xy.^2);
   imgPts = nonmaxsup2d(heset);
   [py, px] = find(imgPts >thresh);
end
