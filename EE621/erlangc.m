function [ans1, ans2] = erlangc(k)

r = 0.95;
a = r*k;

pk = a^(k)/(factorial(k)*0.05);
sumpi = 0;

for i = 0:k-1
    sumpi = sumpi + a^(i)/factorial(i);
end

ans1 = pk/(sumpi+pk);

ans2 = 20*ans1/k;

