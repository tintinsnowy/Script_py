a=0.5;
S=[1 2 1 2 3 4];
L=[1 1 0 0 ; 0 1 1 1;1 0 1 0.5];
w=ones(1,5);
%p[t,:]=w[t,:]/sum(w[t,:]);
%x = sum(rand >= cumsum([0, p[t,:s]]));
for time=2:7
    j=S(time-1);
    for i=1:3
        w(time,i)=((1-a)^(L((j-1)*3+i))).*w(time-1,i);
    end
end
%---------2-----------
a =0.25
w = ones(1,5);
A=[1 1 1 1 1 1 1 ;Inf 0 1 0 Inf 1 0 ;Inf 1 0 1 0 1 1;Inf 1 1 Inf 1 Inf 0; Inf 1 Inf Inf 0 Inf Inf];
P=w/sum(w);
L = [0 1 1 0 0 1 1];
a=0.25;
for t = 2:7
    H=A(:,t);
    sum_w=0;
    for i=1:5
      if H(i) ~= Inf
          sum_w= sum_w+w(i);
      end
    end 
    p=w/sum_w;
    m = ~xor(H,L);
    for i=1:5
        if H(i) ~= Inf
           r = sum(p)/(1+a)-m(i);
           w(i) = w(i)*(1-a).^r
        end    
    end
end
%--------2--jiahui-------
A=[ 0 1 1 0 0 1 1];
P=zeros(1,5);
m=zeros(1,5);
r=zeros(1,5);
L=[1 1 1 1 1 1 1 ;Inf 0 1 0 Inf 1 0 ;Inf 1 0 1 0 1 1;Inf 1 1 Inf 1 Inf 0; Inf 1 Inf Inf 0 Inf Inf];
w(1,:)=[1,1,1, 1, 1];
ar=[1 2 3 4 5];
%p[t,:]=w[t,:]/sum(w[t,:]);
%x = sum(rand >= cumsum([0, p[t,:s]]));
a=0.25;
for time=2:8
    r=zeros(1,5);
    w(time,:)=w(time-1);
    id=find(L(:,time-1)<3);
    P(id)=w(time-1,id)/sum(w(time-1,id));
    j=A(time-1);
    for i = 1:5
        if L((time-2)*5+i)==j
            m(i)=0;
        else
            m(i)=1;
        end
    end           
    r(id)=sum((P(id).*m(id)))/(1+a)-m(id);
    w(time,:)=w(time-1,:).*((1+a).^r);
end
