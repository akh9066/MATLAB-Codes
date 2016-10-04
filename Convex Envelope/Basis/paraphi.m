function Q = paraphi(dom,step,K)

x1rng = dom(3)-dom(1);
x2rng = dom(4)-dom(2);
x1pt = x1rng/step +1;
x2pt = x2rng/step +1;
npt = x1pt*x2pt;
x1 = repmat([dom(1):step:dom(3)]',x2pt,1);

x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);


Q = zeros(npt,2*K);

rhoMax = min(dom(3),dom(4));

rho = zeros(npt,1);
%theta = zeros(npt,1);

for j = 1:npt
    [~,rho(j)]  = cart2pol(x1(j),x2(j));
end

%drng = (x1rng/2)^2+(x2rng/2)^2; %Max distance
for i = 1:2:2*K-1     %Basis function index
    for j = 1:npt   %Basis function value index
        
        if (rho(j) - (i-1)*rhoMax/(2*K) > 0) && (rho(j) <= rhoMax)
            Q(j,i) = (rho(j) - (i-1)*rhoMax/(2*K))^2;
        elseif (rho(j) > rhoMax)
            Q(j,i) = (rhoMax - (i-1)*rhoMax/(2*K))^2;
        else
            Q(j,i) = 0;
        end
        
    end
end

for i = 2:2:2*K
    for j = 1:npt
        
        if (rhoMax - rho(j) - (i-2)*rhoMax/(2*K) > 0)
            Q(j,i) = (rhoMax - rho(j) - (i-2)*rhoMax/(2*K))^2;
        else
            Q(j,i) = 0;
        end
    end
end

x1grid = dom(1):step:dom(3);
x2grid = dom(2):step:dom(4);

% figure();
% for basisIt = 1:2*K
%     QMatrix = reshape(Q(:,basisIt),x1pt,x2pt);
%     surf(x1grid,x2grid,QMatrix);
%     pause(2);
% end

% Q = linphi([-5 5;-5 5],0.25,4); 


    
