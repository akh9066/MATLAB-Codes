function [tpm, coord] = gentpm(type, n)
%n is the number of nodes in grid
%m is the number of rows/columns in grid n = m^2
%tpm is gossip matrix
%coord is the coordinate matrix for plotting

m = sqrt(n);

if strcmp(type,'grid')
    tpm = zeros(n, n);
    for a = 1:n
        for b = 1:n
            tpm(a,b) = ((abs(a-b)==m) + ((a-b)==1)*(mod(a-1,m)~=0) + ((b-a)==1)*(mod(a,m)~=0))/...
                (2 + (mod(a,m)~=1&mod(a,m)~=0) + (ceil(a/m)~=1&ceil(a/m)~=m));
        end
    end

   coord = zeros(n, 2);
   coord(:,1) = mod(0:n-1,m)+1;
   coord(:,2) = ceil((1:n)/m);
   
elseif strcmp(type,'ring')
    tpm = zeros(n,n);
    tpm(1,2) = 1;
    tpm(1,n) = 1;
    for a = 2:n-1
        tpm(a,a-1) = 1;
        tpm(a,a+1) = 1;
    end
    tpm(n,n-1) = 1;
    tpm(n,1) = 1;
    
    tpm = tpm/2;

elseif strcmp(type,'FC')
    tpm = ones(n,n);
    tpm = tpm - eye(n);
    tpm = tpm/(n-1);
   
elseif strcmp(type,'I')
    tpm = eye(n);
    
end

