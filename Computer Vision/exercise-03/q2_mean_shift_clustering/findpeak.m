function peaka = findpeak(data, idx, r) 
% created by sherry 
% idx is the column index of the data(how many columns are there) 
% data is an n * p matrix containing p data points
% and r is the search window radius.
    [n,p] = size(data);
    shift =Inf;
	% thresh is 0.1
    dis=zeros(1,idx);
    current_point = data(:,round(idx/2));% current piont
    r2 = r^2;
    
    while shift>0.1
        % Find points inside the spherical window
		indices = sum( (data - repmat(current_point, 1, p)).^2, 1) < r2;	 		
		% Shift the current point to their center
		A = data(:, indices);  % smart use logical marix!!!
		old = current_point;
		current_point = mean(A, 2);
		shift = sqrt(sum((old - current_point).^2));
    end
    	peaka = current_point;
end
