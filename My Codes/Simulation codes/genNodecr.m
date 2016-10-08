function nodecr = genNodecr(adgraph)

nodes = length(adgraph); %no. of nodes 
nodecr = zeros(nodes,1); %vector of node creativities

for i = 1:nodes
    nbr = nbrad(adgraph,i); %vector of nbrs of node i
    crsum = 0;  %sum of all pair creativities
    numpair = 0; 
    numnbr = length(nbr);
    
    for j = 1:numnbr-1
        for k = j+1:numnbr
            % indcr - time based creativity, paircr - effect of edge
            % between nbrs
<<<<<<< HEAD
            crsum = crsum + paircr(adgraph(i,nbr(j)),adgraph(i,nbr(k)),adgraph(nbr(j),nbr(k)));
=======
            crsum = crsum + paircr(adgraph(nbr(j),nbr(k)));
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
            numpair = numpair + 1;
        end 
    end
    
    nodecr(i) = indcr(numnbr)*crsum/(2*numpair);
    
end


            
        
        