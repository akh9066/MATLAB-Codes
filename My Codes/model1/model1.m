%self creativity function - given an adjacency matrix of the graph at the
%end of one time instant, find the corr. one at the start of the next

%creativity listening function - if neighbour creative, then probability of
%listening is inversely proportional to own degree 

%creativity acceptance function - once idea is listened to, the probability
%of accepting is directly proportional to the degree of the source

<<<<<<< HEAD
=======
clear all;

>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
function newcr = model1(seed, nodes, nlimit, niter, l, a, s)

% seed = random_graph(5);
% nodes = 500;
% nlimit = 2;
% 
% niter = 1000;
% l = 1;
% a = 1;
% s = 0.5;

tic
modad = genBA(seed, nodes, nlimit);
toc 
cr = [];
 

for k = 1:niter
    [modad, cr] = genmodad(modad, cr, s); % new list of creative nodes and modad are generated 
    z = length(cr)
    if length(cr) ~= 0
        for j = 1:length(cr)  % for every creative node
           j;
           cr(j);
            nbr = nbrad(modad, cr(j)); % find all neighbors

            for v = 1:length(nbr)   % for every meighbor of the given creative node
                if modad(nbr(v),nbr(v)) == 0
                    probcr = problisten(modad, nbr(v), l)*probaccept(modad, nbr(v), cr(j), a);              
                    modad(nbr(v),nbr(v)) = logical(rand() < probcr); % make it creative depending on listening and accepting probabilities
                end
            end
            
        end
    end
    
    newcr = length(find(diag(modad))) - z  % number of new creative nodes generated in the given time interval
end

 
    
      

