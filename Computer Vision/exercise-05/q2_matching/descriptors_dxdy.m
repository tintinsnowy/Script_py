function descriptor = descriptors_dxdy(img, px, py, windowsize, sigma, bins)
    rad = round((windowsize - 1)/2);
	[row, col, c] = size(img);
	descriptor = zeros(length(px), bins^2);
	for i = 1:length(px)
		minx = max(px(i) - rad, 1);
		maxx = min(px(i) + rad, col);
		miny = max(py(i) - rad, 1);
		maxy = min(py(i) + rad, row);
        imgWin = img(miny:maxy, minx:maxx, :);
		hist = histdxdy(imgWin,sigma,bins);
		descriptor(i, :) = hist';
	end

end
