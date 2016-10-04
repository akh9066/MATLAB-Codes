function AMatrixLocalTest()

clear variables
close all

rng shuffle

func = 'rastrigin';
basis = 'polar';
scale = 40;

K = 5; %No. of basis functions/2
p = 5;
q = 5;
ntheta = 5;

probConstr = 1;

[Q,A,g,x1pt,x2pt,npt,x1,x2,step,dom] = genQA(func,basis,scale,K,p,q,ntheta);

%shuffle Q

for i = 2:npt-1 %Random walk constraints
    
    if (rand() <= probConstr)
        if (mod(i,x1pt) ~= 0) && (mod(i,x1pt) ~= 1) && (i > x1pt+1) && (i < npt-x1pt)
            
%                       A(2*i-1,:) = 2*Q(i,:)-Q(i+x1pt+1,:)-Q(i-x1pt-1,:);
%                       A(2*i,:) = 2*Q(i,:)-Q(i+x1pt-1,:)-Q(i-x1pt+1);
            
             A(2*i-1,:) = 2*Q(i,:)-Q(i+1,:)-Q(i-1,:);
             A(2*i,:) = 2*Q(i,:)-Q(i+x1pt,:)-Q(i-x1pt,:);
            
        elseif (i < x1pt)
            A(2*i-1,:) = 2*Q(i,:)-Q(i+1,:)-Q(i-1,:);    
            
        elseif (i > npt-x1pt+1)
            A(2*i-1,:) = 2*Q(i,:)-Q(i+1,:)-Q(i-1,:);
         
        
        elseif (mod(i,x1pt) == 0) && (i ~= x1pt) && (i > x1pt)
            A(2*i,:) = 2*Q(i,:)-Q(i+x1pt,:)-Q(i-x1pt,:);
            
        elseif (mod(i,x1pt) == 1) && (i ~= npt-x1pt+1) && (i > x1pt)
            A(2*i,:) = 2*Q(i,:)-Q(i+x1pt,:)-Q(i-x1pt,:);
        end        
   end
    
end

c = ones(npt,1);
f = -c'*Q;
A = [A;Q];
b = [zeros(2*npt,1);g];

tic
r = linprog(f,A,b);
toc

u = Q*r;
U = reshape(u,x1pt,x2pt)';
F = reshape(g,x1pt,x2pt)';

x1grid = [dom(1):step:dom(3)];
x2grid = [dom(2):step:dom(4)];

% figure();
% surf(x1grid,x2grid,F);
figure();
surf(x1grid,x2grid,U);
% surf(x1grid,x2grid,U,'AlphaData',0.2);

plotMinMax(x1grid,x2grid,U);




