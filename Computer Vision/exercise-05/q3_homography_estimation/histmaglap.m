function histogram = histmaglap(img, sigma, bins)

	% this function assumes that the image is double and in the range 0..1

	% calculate the gradient magnitude
    img = laplace(img,sigma);
	[imgDx, imgDy] = imgradientxy(img);
 
	% define a 2D histogram with "bins^2" entries
	histogram = zeros(bins, bins); % y and x

	% execute the loop for each pixel in the image
	for i = 1:size(img, 1)
		for j = 1:size(img, 2)
			% increment a histogram bin which corresponds to
			% the value of pixel i,j; h(dx,dy)
			x = round( (imgDx(i, j) + 256)/511 * bins ) + 1;
			y = round( (imgDy(i, j) + 256)/511 * bins ) + 1;
			histogram(x, y) = histogram(x,y) + 1;
		end
	end

	% normalize the histogram such that its integral (sum) is equal 1
	histogram = histogram / sum(histogram(:));

	% reshape the histogram to obtain a 1D row vector of size 1 x bins^2
	histogram = reshape(histogram, 1, bins^2);

end
