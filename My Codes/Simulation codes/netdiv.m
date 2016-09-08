%close all 
clear all

nodes = 500;
K = 5;
r = 1;

m = 5;
m0 = 2;

%adgraph = genWS(nodes,K,r); %adjacency matrix of network
adgraph = BA_model(nodes,m, m0);

degvec = sum(adgraph,2);    %vector of node degrees
crvec = genNodecr(adgraph); %vector of node creativities

degcr = zeros(nodes,2); % vector of degree vs avg creativity

for i=1:nodes
    degcr(degvec(i)+1,1) = degcr(degvec(i)+1,1) + crvec(i);
    degcr(degvec(i)+1,2) = degcr(degvec(i)+1,2) + 1;
end

degcr(:,1) = degcr(:,1)./degcr(:,2);

figure();
plot([0:nodes-1]',degcr(:,1));







