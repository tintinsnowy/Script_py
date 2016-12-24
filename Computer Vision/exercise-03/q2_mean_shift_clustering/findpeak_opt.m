function [peak,cpts] = findpeak_opt(data, idx, r) 
   current = data(:,idx);
   thres = Inf;
   [n,p]=size(data);
   cpts= zeros(1,p);
   
   while thres>0.1
        diff = sum((data-repmat(current,1,p)).^2,1);
        new_point = mean(data(:, diff<=r^2), 2);
        cpts(diff<r^2) = 1;
        
        thres = norm(current - new_point);
		current = new_point;
   end
   
   peak = current;
   cpts = logical(cpts);

end
