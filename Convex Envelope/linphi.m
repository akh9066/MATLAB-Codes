function Q = linphi(dom,step,K)

x1rng = dom(3)-dom(1);
x2rng = dom(4)-dom(2);
x1pt = x1rng/step +1;
x2pt = x2rng/step +1;
npt = x1pt*x2pt;
x1 = repmat([dom(1):step:dom(3)]',x2pt,1);

x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);


Q = zeros(npt,2*K);

drng = sqrt((x1rng/2)^2+(x2rng/2)^2); %Max distance
for i = 1:2:2*K-1     %Basis function index
    for j = 1:npt   %Basis function value index
        d = sqrt(x1(j)^2+x2(j)^2);
        if d > i*drng/(2*K)
            Q(j,i) = d - i*drng/(2*K);
        else
            Q(j,i) = 0;
        end
    end
end

for i = 2:2:2*K
    Q(:,i) = flipud(Q(:,2*K-i+1));
end

    
