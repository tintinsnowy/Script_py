function [w]=perceptionLearn(x,y,learningRate,maxEpoch)  
% Perception Learn Algorithm  
% x,y ????????y??{-1,+1}  
  
[m,n]=size(x);

x=[x ones(m,1)]; 
% normalized 
max_nor= 0;
for row = 1:m
    a = 0;
    for col =1:(n+1)  
        a=a+x(row,col)^2;  
    end 
    if a> max_nor
        max_nor=a;
    end
end;
x = x/sqrt(max_nor)

w=zeros(1,n+1);
finish=true; 
num = 0;
for epoch=1:maxEpoch  
    for samlendex=1:m 
        num = num+1;
        disp(num)
        %disp(w)
        if sign(x(samlendex,:)*w')~=y(samlendex)
            finish=false;  
            w=w+learningRate*y(samlendex)*x(samlendex,:);
        end  
    end  
    if finish==true  
        break;  
    end  
end  
