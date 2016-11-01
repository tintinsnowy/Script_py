function [w]=perceptionLearn(x,y,learningRate,maxEpoch)  
% Perception Learn Algorithm  
% x,y ????????y??{-1,+1}  
  
[m,n]=size(x);  
x=[ones(m,1) x];  
w=zeros(1,n+1);  
finish=true;  
for epoch=1:maxEpoch  
    for samlendex=1:m  
        if sign(x(samlendex,:)*w')~=y(samlendex)  
            finish=false;  
            w=w+learningRate*y(samlendex)*x(samlendex,:)
        end  
    end  
    if finish==true  
        break;  
    end  
end  



