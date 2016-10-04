function probacc = fprobaccept(degvec, modad, i, j, a)

degj = degvec(j);
degi = degvec(i);
sumdeg = 0;

nbr = nbrad(modad, i);

for k = 1:length(nbr)
    sumdeg = sumdeg + degvec(nbr(k))^(a);
end

if (sumdeg~=0)
    probacc = degi*(degj^(a)/sumdeg); % modified accepting probability (Distributing the degree)
else
    probacc = 1;
end

