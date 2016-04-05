function [k, b] = findk(a, p)

p = 0.01;
b = 1;
sum = 1;
k = 0;

while (b > p)
    k = k+1;
    sum = sum + a^(k)/factorial(k);
    b = a^(k)/factorial(k)/sum;
   
end 


