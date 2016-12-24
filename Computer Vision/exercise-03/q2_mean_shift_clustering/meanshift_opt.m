function [labels, peaks] = meanshift_opt(data, r)
   	[n, p] = size(data);

	labels = zeros(1, p);
	peaks = zeros(n, p);
	thres = r/2;
	n_peaks = 0;

	for i=1:p
		% skip already assigned points
		if labels(i) > 0
			continue;
		end

		% call findpeak for each data point
		[new_peak, cpts] = findpeak_opt(data, i, r); % optimized version
	     
		% if distance between two peaks < r/2 unify peaks
		dists_to_peak = sqrt(sum((repmat(new_peak, 1, n_peaks) - peaks(:, 1:n_peaks)).^2, 1));
		[min_dist, min_index] = min(dists_to_peak);
		if min_dist < thres
			% new peak too close to existing peak: use old peak
			labels(i) = min_index;
		else
			% new peak far enough away: add it to the list
			n_peaks = n_peaks + 1;
			labels(i) = n_peaks;
			peaks(:, n_peaks) = new_peak;
		end

		% add all points in the 'basin of attraction' of this peak
		indices = sqrt(sum((data - repmat(new_peak, 1, p)).^2, 1)) < r;
		labels(indices) = labels(i);

		% add all cpts (points close to convergence path) to this peak
		labels(cpts) = labels(i);
	end
	peaks = peaks(:, 1:n_peaks);

end
