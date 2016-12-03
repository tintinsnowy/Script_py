function houghSpace=houghtransform(imgEdge,nBinsRho,nBinsTheta)
% created by Sherry Yang
% the first one uses matrix calculation which is much faster
[row, col] = size(imgEdge);
D = norm(size(imgEdge)); % Length of image diagonal
R = -D:(2*D/(nBinsRho - 1)):D;
theta = linspace(0,pi,nBinsTheta);

houghSpace = zeros(nBinsRho,nBinsTheta);%initialize
D = norm([row, col]);
[v_x,v_y] = find(imgEdge); %find the edge
acc = zeros(numel(v_x),nBinsTheta); % to accumulate D
cosine = (0:row-1)'*cos(theta);
sine = (0:col-1)'*sin(theta);

acc = cosine(v_x,:)+sine(v_y,:);
for i=1:nBinsTheta
    houghSpace(:,i)=hist(acc(:,i),R);
end
end

%the second one is much slower
%function houghSpace=houghtransform(imgEdge,nBinsRho,nBinsTheta)
%[row, col] = size(imgEdge);
%D = norm(size(imgEdge)); % Length of image diagonal
%houghSpace=zeros(nBinsRho,nBinsTheta);
%for i=1:row
%    for j=1:col
%       if imgEdge(i,j)==1
%         for theta = 1:nBinsTheta
%             t = pi*theta/nBinsTheta;
%             d = (i-1)*cos(t)+(j-1)*sin(t);
%             Dd =int16((D+d)*nBinsRho/(2*D));
%             houghSpace(Dd,theta) = houghSpace(Dd,theta)+1;
%         end
%       end
%    end
%end
%end
