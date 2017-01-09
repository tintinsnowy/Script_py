M1=[2 -12;1 -5];
M2=[1 2 0; -2 1 2;1 3 1];
M3=[1 1 0; 3 -1 0; 0 0 -2];
x=[1;1;1];
%-------------a-m1
[row,col] = size(M2);
y=zeros(row,1);
for iter =1:5 
    y=M2*x;
    %norm=max(y);
    norm=max(abs(y));
    l = y.*x;  % Rayleigh
    m = x.*x;
    lamda = l/m;
    x = y / norm;%new
end
%----------b--------M3--
x=[1;1;1];
[row,col] = size(M3);
tmp=zeros(row,1);
for iter =1:4
    y=M3*x;
    norm=max(abs(y));
    x = y / norm
end

%-------------c-----------------
M1=[2 -12;1 -5];
M1 = inv(M1);%????
[row,col] = size(M1);
y=zeros(row,1);
x=[1;1];
lamda=x;
pre =[Inf,Inf];
while max(max(abs(pre-lamda)))>1.0e-5
    y=M1*x;
    %norm=max(y);
    norm=max(abs(y));
    l = y.*x;  % Rayleigh
    m = x.*x;
    pre = lamda;
    lamda = l/m;
    x = y / norm;
end
small = min(lamda)
lamda = lamda.^(-1);

%-----------4--------
M4=[4 5;6 5];
M5=[-4 10;7 5];
[row,col] = size(M5);
y=zeros(row,1);
x=[1;1];
lamda =x;
pre =[Inf,Inf];
count=0;
offset =1;
while sum(pre==y)~=2 
    pre =y
    y=M5*x;%M5
    %l = y.*x;  % Rayleigh
    %m = x.*x;
    %lamda = l/m
    count = count+1
    norm=max(y);
        y = y / norm%new
    x= y;
    
    y = floor(y*1000);
    
end 



