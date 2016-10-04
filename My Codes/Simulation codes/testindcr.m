%close all
clear all
nodes = 50;

degcr = [1:nodes; zeros(1,nodes)]';

for i=1:nodes
    degcr(i,2) = indcr(i);
end

figure();
plot(degcr(:,1), degcr(:,2));

