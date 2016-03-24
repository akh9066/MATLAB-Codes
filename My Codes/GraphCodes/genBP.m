function graphBP = genBP(m,n,p)

bpgraph = rand(n,m)<p;

upgraph = zeros(n,n);

for k = 1:n
    nbrplay = find(bpgraph(k,:));
    
    for v=1:length(nbrplay)
        nbractor = find(bpgraph(:,nbrplay(v))).';
        upgraph(k,nbractor) = 1;
    end
    
    upgraph(k,k) = 0;
end

graphBP = upgraph;

    



