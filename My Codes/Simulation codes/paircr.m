%i is the center node. j and k are its nbrs. edgewtJK is the wt of the edge
%between them

function cr = paircr(edgewtIJ,edgewtIK,edgewtJK)

if edgewtJK ~= 0
    cr = 1;
    
elseif edgewtJK == 0
    cr = 2;
end
