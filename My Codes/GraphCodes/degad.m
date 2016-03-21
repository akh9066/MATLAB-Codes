function deg = degad(adgraph, i)

if (adgraph(i,i)==0)
    deg = sum(adgraph(i,:)~=0);
else 
    deg = sum(adgraph(i,:)~=0) - 1 ;
end

