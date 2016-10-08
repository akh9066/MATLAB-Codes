<<<<<<< HEAD
%i is the center node. j and k are its nbrs. edgewtJK is the wt of the edge
%between them

function cr = paircr(edgewtIJ,edgewtIK,edgewtJK)

if edgewtJK ~= 0
    cr = 1;
    
elseif edgewtJK == 0
=======
function cr = paircr(edgewt)

if edgewt == 1
    cr = 1;
    
elseif edgewt == 0
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
    cr = 2;
end
