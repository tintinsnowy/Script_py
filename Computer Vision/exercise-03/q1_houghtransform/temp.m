function houghSpace=houghtransform(imgEdge,nBinsRho,nBinsTheta)
% created by Sherry Yang
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


%rho = (-rhoLimit:1:rhoLimit);          
%theta = (0:pi/:pi);

end


%
