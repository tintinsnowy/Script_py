function pairwise_matrix = pairwise_potential_prefactor_matrix(img, pairwise_weight)

	[h,w]= size(img);
	from = zeros(4*h*w,1);
	to = zeros(4*h*w,1);
	cost = zeros(4*h*w,1);
	idx = 0;

	for y = 1:h
		for x = 1:w
			if x ~= 1
				%left neighbor
				idx = idx + 1;
				from(idx) = coord_transform(h,x,y);
				to(idx) = coord_transform(h,x-1,y);
				cost(idx) = pairwise_potential_prefactor(img, x, y, x-1, y, pairwise_weight);
			end

			if x ~= w
				%right neighbor
				idx = idx + 1;
				from(idx) = coord_transform(h,x,y);
				to(idx) = coord_transform(h,x+1,y);
				cost(idx) = pairwise_potential_prefactor(img, x, y, x+1, y, pairwise_weight);
			end

			if y ~= 1
				%top neighbor
				idx = idx + 1;
				from(idx) = coord_transform(h,x,y);
				to(idx) = coord_transform(h,x,y-1);
				cost(idx) = pairwise_potential_prefactor(img, x, y, x, y-1, pairwise_weight);
			end

			if y ~= h
				%bottom neighbor
				idx = idx + 1;
				from(idx) = coord_transform(h,x,y);
				to(idx) = coord_transform(h,x,y*1);
				cost(idx) = pairwise_potential_prefactor(img, x, y, x, y+1, pairwise_weight);
			end
		end
	end
	 		 	
	pairwise_matrix = sparse(from(1:idx),to(1:idx),cost(1:idx));

end
