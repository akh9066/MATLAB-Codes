%Function which generates a BA network given a seed network 
function netBA = genBA(seed, nodes, nlimit)

netBA = SFNG(nodes, nlimit, seed); 

%PLplot(netBA);
%CNet(netBA);
