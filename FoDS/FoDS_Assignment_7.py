#---Sherry Yang      2016.12.20 -----------------
#---home work for data processing----------------
#---filein/ substring/regular expression/ math---


import re
from math import sqrt,pow

f =['data_310_10_xl.txt','data_310_10_jl.txt','data_310_10_s.txt']
MT=0
s = 0
u = 0
count = 0
x = []
for i in range(0,3):
 now = open(f[i], 'r')
 for line in now.readlines():
    if line[0] !='B'and line[0] !='T':
       w = float(re.sub(r';.*$',"",line))
       MT += w
       s = float(re.sub(r'.*;',"",line))
       count +=1
       u += s
       x.append(s)

u = u/count
print('average(MT):'+str(MT/count))
print('COUNT:'+str(count))
sigma = 0
#sigma
for i in range(0,count):
   sigma += pow((x[i]-u),2)

sigmax = sqrt((sigma/count))
print('SigmaX:'+ str(sigmax))
       
