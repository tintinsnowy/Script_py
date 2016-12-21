function [labels, peaks] = meanshift(data, r)
   [n,p]=size(data);
   labels = zeros(1,p);
   peaks = zeros(n,p);
   thres = r/2;
   
   for i=1:p
      current = findpeak(data,i,r);
      labels(i) = i;
	  peaks(:,i) = current;
      %find the similar ones
      for j=1:(i-1)
			if sqrt(sum((current - peaks(:, j)).^2)) < thres
				labels(i) = labels(j);
			end
		end

   end
end
