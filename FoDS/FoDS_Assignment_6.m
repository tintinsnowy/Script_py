M=[1 2 3;
3 4 5;
5 4 3;
0 2 4;
1 3 5];
t_M = M'*M
M_t =M*M'

[t_V,t_D] = eig(t_M)
[V_t,D_t] = eig(M_t)
[U,S,V] = svds(M)