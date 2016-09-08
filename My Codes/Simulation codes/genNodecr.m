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
            crsum = crsum + paircr(adgraph(nbr(j),nbr(k)));
            numpair = numpair + 1;
        end 
    end
    
    nodecr(i) = indcr(numnbr)*crsum/(2*numpair);
    
end


            
        
        