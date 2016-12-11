function peaka = findpeak(data, idx, r) 
    [n,y] = size(data);
    shift =1;
	% thresh is 0.1
    dis=zeros(1,idx);
    p= data(:,int8(idx/2));
    while shift>0.1
        for i=1:idx
           dis(i)=norm(data(:,i)-p);
        end
        %dis = sum((data-repmat(p,n,1)).^2);
        v_y = find(dis<=r);
        if(isempty(v_y)) peaka = random*ones(n,1);
        elseif(sum(size(v_y))>(n+1))
          peaka=mean(data(:,v_y))
        else
          peaka = data(:,v_y);
        end
         shift = norm(peaka-p);
         p = peaka;
    end
end
