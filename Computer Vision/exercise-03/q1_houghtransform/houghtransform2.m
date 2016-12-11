%the second one is much slower
function houghSpace=houghtransform(imgEdge,nBinsRho,nBinsTheta)
[row, col] = size(imgEdge);
D = norm(size(imgEdge)); % Length of image diagonal
houghSpace=zeros(nBinsRho,nBinsTheta);
for i=1:row
    for j=1:col
       if imgEdge(i,j)==1
         for theta = 1:nBinsTheta
             t = -pi/2 + pi*theta/nBinsTheta;
             d = i*cos(t)+j*sin(t);
             Dd =round((D+d)*nBinsRho/(2*D))+1;
             houghSpace(Dd,theta) = houghSpace(Dd,theta)+1;
         end
       end
    end
end
end
