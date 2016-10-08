<<<<<<< HEAD
close all 
clear all
rng shuffle

tic 

nodes = 10000;
K = 5;
r = 0.1;

m = 10;
m0 = 100;

%netstrength = randi(100,nodes);
netstrength = 1*ones(nodes);

adgraph = netstrength.*genWS(nodes,K,r); %adjacency matrix of network

%adgraph = BA_model(nodes,m, m0);

degvec = sum(adgraph>0,2);    %vector of node degrees
=======
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
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
crvec = genNodecr(adgraph); %vector of node creativities

degcr = zeros(nodes,2); % vector of degree vs avg creativity

for i=1:nodes
    degcr(degvec(i)+1,1) = degcr(degvec(i)+1,1) + crvec(i);
    degcr(degvec(i)+1,2) = degcr(degvec(i)+1,2) + 1;
end

degcr(:,1) = degcr(:,1)./degcr(:,2);

figure();
plot([0:nodes-1]',degcr(:,1));


<<<<<<< HEAD
toc
=======

>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5




