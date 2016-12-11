cub = -1/2+rand([30,100]);
dis_c =zeros(30,30);
angle_c = zeros(30,30);
% remember the usage of norm(a)
% usage of bot
for i=1:30
    for j =1:30
       a = cub(i,:);
       b = cub(j,:);
       dis_c(i,j) = norm(a-b);
       angle_c(i,j) = acos(dot(a,b)/(norm(a)*norm(b)));
    end
end

%%%  generate unity ball
ball = -1+2*rand([30,100]);
dis_u =zeros(30,30);
angle_u = zeros(30,30);
% remember the usage of norm(a)
% usage of bot
for i=1:30
    for j =1:30
       a = ball(i,:);
       b = ball(j,:);
       dis_u(i,j) = norm(a-b);
       angle_u(i,j) = acos(dot(a,b)/(norm(a)*norm(b)));
    end
end
