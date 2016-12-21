function [labels, peaks] = meanshift_opt(data, r)
   [n,p]=size(data);
   labes = zeros(1,p);
   peaks = zeros(n,p);
   for i=1:p
      current = findpeak(datam,data[:,i],r);
      
   end

end
