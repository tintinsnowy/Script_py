function [vRho vTheta] = findhoughpeaks(houghSpace, thresh)
     [row, col]=size(houghSpace);
     imResult=nonmaxsup2d(houghSpace);
     [vRho vTheta]=find(imResult>thresh);
	% insert your code her
end
