function dvec = degvec(modad);

n = length(modad(1,:));

for k = 1:n
    dvec(k) = degad(modad, k);
end