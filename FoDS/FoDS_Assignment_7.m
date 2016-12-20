M1=[2 -12;1 -5];
M2=[1 2 0; -2 1 2;1 3 1];
M3=[1 1 0; 3 -1 0; 0 0 -2];
x=[1;1;1];
%-------------a-m1
[row,col] = size(M2);
y=zeros(row,1);
[V , D , W ] = eig(M1);
for iter =1:5 
    for i=1:row       
         for j =1:col 
              y(i)= y(i)+M2(i,j)* x(j); 
         end
    end
    norm=max(abs(y));
    x = y / norm;  
end
%----------b--------M3--
x=[1;1;1];
[row,col] = size(M3);
tmp=zeros(row,1);
for iter =1:4
    for i=1:row       
         for j =1:col 
              tmp(i)= tmp(i)+M3(i,j)* x(j); 
         end
    end
    norm=max(abs(tmp));
    x = tmp / norm
end

%-------------c-----------------
M1=[2 -12;1 -5];
M1 = inv(M1);%????
[row,col] = size(M1);
tmp=zeros(row,1);
x=[1;1];
pre =[Inf,Inf];
while abs(pre-x)>1.0e-5
    for i=1:row       
         for j =1:col 
              tmp(i)= tmp(i)+M1(i,j)* x(j); 
         end
    end
    norm=max(abs(tmp));
    pre = x;
    x = tmp / norm
end
small = min(x);
langda = x.^(-1);

%-----------4
M4=[4 5;6 5];
M5=[-4 10;7 5];
[row,col] = size(M5);
y=zeros(row,1);
x=[1;1];
pre =[Inf,Inf];
count=1;
while abs(pre-x)>=1.0e-3
    for i=1:row       
         for j =1:col 
              y(i)= y(i)+M5(i,j)* x(j); 
         end
    end

    norm=max(abs(y));
    pre = x;
    x = y / norm;
    count= count+1;
end

%----------------3


