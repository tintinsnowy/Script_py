function foreground_map = foreground_pmap(img, fg_histogram, bg_histogram)
   [row,col,~]=size(img);
   foreground_map=zeros(row,col);
   n_bins = size(fg_histogram,2);
   
   for y = 1:row
		for x = 1:col
			bins = min(n_bins, round( img(y,x,:)/256 * n_bins ) + 1);
			fg_score = fg_histogram(bins(1), bins(2), bins(3));
			bg_score = bg_histogram(bins(1), bins(2), bins(3));
 		  	
			foreground_map(y,x) = bg_score/(fg_score+bg_score);
		end
	end


end
