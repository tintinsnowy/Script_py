function peaka = findpeak(data, idx, r) 
    n = size(data(:,1));
    shift =0.1;
	% thresh is 0.1
    dis=zeros(n);
    p= data(int8(n/2),:);
    done =1;
    while done
        for i=1:n
           dis(i)=norm(data(i,:)-p);
        end
        v_x = find(dis<=r);
        if(sum(size(v_x))>(idx+1))
          peaka=mean(data(v_x,:))
        else
          peaka = data(v_x,:);
        end
        if norm(peaka-p)<=shift
          done =0;
        end
    end
end
