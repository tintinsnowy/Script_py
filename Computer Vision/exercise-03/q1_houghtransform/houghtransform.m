function houghSpace=houghtransform(imgEdge,nBinsRho,nBinsTheta)
[row, col] = size(imgEdge);
D = norm(size(imgEdge)); % Length of image diagonal
houghSpace=zeros(nBinsRho,nBinsTheta);
for i=1:row
    for j=1:col
       if imgEdge(i,j)==1
         for theta = 1:nBinsTheta
             t = pi*theta/nBinsTheta;
             d = (i-1)*cos(t)+(j-1)*sin(t);
             Dd = int8(d*nBinsRho/(2*D));
             if Dd==0
                 Dd =1;
                 houghSpace(Dd,theta) = houghSpace(Dd,theta)+1;
             end
         end
       end
    end
end
end
