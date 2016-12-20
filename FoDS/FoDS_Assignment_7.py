#---Sherry Yang      2016.12.20 -----------------
#---home work for Flajolet-Martin----------------
import re
from math import sqrt,pow

#function part
def zeros( w ):
   tmp_sum=0;
   for i in range(len(w)):
      tmp_sum=tmp_sum*pow(2,4)+float(w[i]);
   #hash function comes in
   tmp_sum = tmp_sum%(pow(2,18));# as long as it's bigger than length
   tmp_sum=bin(int(tmp_sum))[2:];
   # start find the 0
   re = 0;
   long = len(tmp_sum);
   for i in range(long-1,-1,-1):
       if tmp_sum[i]=='0':
           re = long-i+1;
           break;
   return re

#main part
z=0
file = open('ips.txt', 'r');
count =1;
for line in file.readlines():
    w = re.findall(r'[0-9]*',line)
    w = list(filter(None, w))
    num = zeros(w);
    if num>z:
       z = num;
res = pow(2,z+1/2);
      
    
