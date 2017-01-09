function h = myhist4(filename, bins)
	% read the image and convert it to double
	img = im2double(rgb2gray(imread(filename)));

	%calculate the gaussian derivatives
	[imgDx, imgDy] = gaussderiv(img, 1.0);

	%define a 2D histogram with "bins^2" entries
	h = zeros(bins,bins);	% dy and dx

	%execute the loop for each pixel in the image
	for i=1:size(img,1)
		for j=1:size(img,2)
			%increment a histogram bin which corresponds to
			%the value of pixel i,j; h(dx,dy)
			x = round( (imgDx(i,j)+1) * (bins / 2) ) +1;
			y = round( (imgDy(i,j)+1) * (bins / 2) ) +1;
			h(x,y) = h(x,y) + 1;
		end
	end

	%normalize the histogram such that its integral (sum) is equal 1
	h = h / sum(sum(h));

	%reshape the histogram to obtain a 1D row vector of size 1 x bins^2
	h=reshape(h,1,bins^2);
end
