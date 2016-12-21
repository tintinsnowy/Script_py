#---Sherry Yang      2016.12.20 -----------------
#---home work for Flajolet-Martin----------------
import re, random,hashlib
from math import pow

#function part
def zeros( w):
   tmp_sum=0;
   for i in range(len(w)):
      tmp_sum=tmp_sum*pow(2,8)+float(w[i]);

   #hash function comes in
   #tmp_sum = tmp_sum%(pow(2,32));# here we use diff Hashfunctions
   #tmp_sum =tmp_sum%(pow(2,15)); # 2nd hash function
   random.seed(tmp_sum);
   tmp_sum = random.randrange(0,pow(2,32)-1); #3rd hash function
   tmp_sum=bin(int(tmp_sum))[2:];# alter it from decimal into binary
   # start find the 0
   re = 0;
   long = len(tmp_sum);
   for i in range(long-1,-1,-1):
       if tmp_sum[i]=='1':
           re = long-i-1;
           break;
   return re

#main part
z=0
file = open('ips.txt', 'r');
for line in file.readlines():
   w = re.findall(r'[0-9]*',line) # read in 4 parts of numbers
   w = list(filter(None, w))
   num = zeros(w);
   if num>z:
      z = num;
res = pow(2,z+0.5);
   
      
    
