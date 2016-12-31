function histogram = calculate_histogram(img, mask, n_bins)

    [row, col, ~]=size(img);
    histogram = 0.001 * ones(n_bins, n_bins, n_bins);
    bins = min(n_bins, round( img/256 * n_bins ) + 1);% avoid the 0 and minus
	 			
	for y = 1:row
		for x = 1:col
			if mask(y,x) ~= 0
				histogram( bins(y,x,1), bins(y,x,2), bins(y,x,3) ) = ...
					histogram( bins(y,x,1), bins(y,x,2), bins(y,x,3) ) + 1;
			end
		end
	end

	%normalize
	histogram = histogram/sum(histogram(:));

end
