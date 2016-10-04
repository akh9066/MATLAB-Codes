function [appk, exactk] = sqrtstaff(a)

k = a;
r = a/k;
pc = 1;
appk = 0;

while(pc > 0.2)
    pk = a^(k)/(factorial(k)*0.05);
    sumpi = 0;
    for i = 0:k-1
    sumpi = sumpi + a^(i)/factorial(i);
    end
    
    pc = pk/(sumpi+pk);
    k = k+1;
end

exactk = k-1;

appk = a + 0.1728*sqrt(a);
