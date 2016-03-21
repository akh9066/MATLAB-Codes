%source j, listener i

function probacc = probaccept(modad, i, j, a)

n = length(modad(1,:));
degj = degad(modad, j)^(a);
sumdeg = 0;

modad(i,i) = 0;

nbr = nbrad(modad, i);%list of neighbors

for k = 1:length(nbr)
    sumdeg = sumdeg + degad(modad, nbr(k))^(a);
end

if (sumdeg~=0)
    probacc = degj/sumdeg;
else
    probacc = 1;
end

    

