function Q = polarnegphi(dom,step,K,ntheta)

x1Center = (dom(1)+dom(3))/2; 
x2Center = (dom(2)+dom(4))/2;

x1rng = dom(3)-dom(1);
x2rng = dom(4)-dom(2);
x1pt = x1rng/step +1;
x2pt = x2rng/step +1;
npt = x1pt*x2pt;
x1 = repmat([dom(1):step:dom(3)]',x2pt,1);

x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);

% To account for domains not centered at (0,0)
x1shift = x1 - ones(npt,1)*x1Center;
x2shift = x2 - ones(npt,1)*x2Center;

Q = zeros(npt,4*K*ntheta);

%drng = sqrt((x1rng/2)^2+(x2rng/2)^2); %Max distance
%rhoMax = min(dom(3),dom(4));
rhoMax = sqrt((x1rng/2)^2+(x2rng/2)^2);

rho = zeros(npt,1);
theta = zeros(npt,1);

for j = 1:npt
    [theta(j),rho(j)]  = cart2pol(x1shift(j),x2shift(j));
    if (theta(j) < 0)
        theta(j) = theta(j) + 2*pi;
    end
end

for l = 1:ntheta
    for i = 1:2:2*K-1     %Basis function index
        for j = 1:npt   %Basis function value index
            
            if (theta(j) >= (l-1)*2*pi/ntheta) && (theta(j) < l*2*pi/ntheta)
          
                if (rho(j) > (i-1)*rhoMax/(2*K)) && (rho(j) <= rhoMax)
                    Q(j,(l-1)*2*K+i) = rho(j) - (i-1)*rhoMax/(2*K);
                elseif (rho(j) > rhoMax)
                    Q(j,(l-1)*2*K+i) = rhoMax - (i-1)*rhoMax/(2*K);
                else
                    Q(j,(l-1)*2*K+i) = 0;
                end
            
            end
            
            
        end
    end
    
    for i = 2:2:2*K
        for j = 1:npt
            
            if (theta(j) >= (l-1)*2*pi/ntheta) && (theta(j) < l*2*pi/ntheta)
                
                if (rhoMax - rho(j) - (i-2)*rhoMax/(2*K) > 0)
                    Q(j,(l-1)*2*K+i) = rhoMax - rho(j) - (i-2)*rhoMax/(2*K);
                else
                    Q(j,(l-1)*2*K+i) = 0;
                end
                
            end
                      
        end
    end
end

Q(:,2*K*ntheta+1:3*K*ntheta) = -Q(:,1:K*ntheta);
Q(:,3*K*ntheta+1:4*K*ntheta) = -Q(:,K*ntheta+1:2*K*ntheta); 

% x1grid = dom(1):step:dom(3);
% x2grid = dom(2):step:dom(4);
% 
% figure();
% for basisIt = 1:4*K*ntheta
%     QMatrix = reshape(Q(:,basisIt),x1pt,x2pt);
%     surf(x1grid,x2grid,QMatrix);
%     pause(3);
% end

% Q = polarphi([-5 5;-5 5],0.25,4,); 
    
    
    
