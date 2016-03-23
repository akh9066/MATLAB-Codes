function nbr = nbrad(modad, i)

nbr = find(modad(i,:)); %nbr is a cell containing the neighbors of i
nbr = nbr(nbr~=i); % removing itself from list of neighbors

%nbr is a row vector