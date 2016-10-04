function newcr = fmodel1(nodes,nlimit,m0,niter,l,s,a,graphtype,plays,p,sp)


% seed = random_graph(5);
% nodes = 500;
% nlimit = 2;
% 
% niter = 1000;
% l = 1;
% a = 1;
% s = 0.5;
% p - prob of actor being in a particular play

if (graphtype == 'BA')
    modad = BA_model(nodes, nlimit, m0); %generate a BA adjacency matrix
    % for BA, avg degree ~ 2*nlimit
elseif (graphtype == 'WS')
    modad = genWS(nodes, nlimit,0.5); %generate a WS adjacency matrix
    % for WS, avg degree ~2*nlimit
elseif (graphtype == 'BP')
    modad = genBP(plays, nodes, p);
    % for BP, avg degree ~ mnp^2 (for small p)
end

cr = [];


for k = 1:niter
    dvec = degvec(modad); % vector containing degrees of all nodes
    [modad, cr] = genmodad(modad, dvec, sp, cr, s); % new list of creative nodes and modad are generated 
    z = length(cr); %no. of creative nodes
    if length(cr) ~= 0
        for j = 1:length(cr)  % for every creative node
           j;
           cr(j);
            nbr = nbrad(modad, cr(j)); % find all neighbors

            for v = 1:length(nbr)   % for every meighbor of the given creative node

                if modad(nbr(v),nbr(v)) == 0
                    problist = problisten(modad, nbr(v), l, sp);
                    probacc = fprobaccept(dvec, modad, nbr(v), cr(j), a);                  
                    probcr = problist*probacc;              
                    modad(nbr(v),nbr(v)) = logical(rand() < probcr); % make it creative depending on listening and accepting probabilities
                end
            end
            
        end
    end
    
    newcr = length(find(diag(modad))) - z;  % number of new creative nodes generated in the given time interval
end

 
    
      

