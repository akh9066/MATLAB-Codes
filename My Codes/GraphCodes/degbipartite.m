function degbipart = degbipartite(m,n,p)
% m - no. of plays
% n - no. of actors
% p - prob of actor being a part of play
% degbipart - avg degree of nodes in unipartite graph of actors
sumactor  = 0;

for k = 1:n-1
    sumplay = 0;
    for i = 0:m
        sumplay = sumplay +  nchoosek(m,i)*nchoosek(n-1,k)*p^(i)*(1-p)^(m-i+i*(n-k-1))*(1-(1-p)^(i))^(k);
    end
    sumactor = sumactor + k*sumplay;
end

degbipart = sumactor;