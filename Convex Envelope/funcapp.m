clear variables
close all

rng shuffle

%dom = [-10 10;-10 10]; %griewank 
dom = [-5 5; -5 5];    %rastrigin, dropwave
%dom = [-40 40;-40 40]; %ackley
%dom = [-500 500; -500 500]; %schwefel
%dom = [-10 10;-6 6];

func = 'rastrigin';
basis = 'asym';
scale = 20;

K = 10; %No. of basis functions/2
p = 5;
q = 5;
ntheta = 10;

probConstr = 1;

[Q,A,g,x1pt,x2pt,npt,x1,x2,step] = genQA(func,basis,scale,K,p,q,ntheta);

%shuffle Q

for i = x1pt+2:npt-x1pt-1 %Random walk constraints
    if (mod(i,x1pt) ~= 0) && (mod(i,x1pt) ~= 1) && (rand()<probConstr)    
        
        A(2*i-1,:) = 2*Q(i,:)-Q(i+x1pt+1,:)-Q(i-x1pt-1,:);
        A(2*i,:) = 2*Q(i,:)-Q(i+x1pt-1,:)-Q(i-x1pt+1);      
    
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

plotMinMax(x1grid,x2grid,U);



        
%g(i) = 5*(1 + (x1(i)^2+x2(i)^2)/4000 - cos(x1(i))*cos(x2(i)/sqrt(2))); %griewank function
%g(i) = -(1+cos(12*sqrt(x1(i)^2+x2(i)^2)))/(0.5*(x1(i)^2+x2(i)^2)+2); %Dropwave function
%g(i) = (2*x1(i)+x2(i)-7)^2 + (x1(i)+2*x2(i)-5)^2;% booth function
%g(i) = (1-x1(i))^2 + 100*(x2(i)-x1(i)^2)^2; %rosenbrock fn
%g(i) = -20*exp(-0.2*sqrt((x1(i)^2+x2(i)^2)/2)) - exp((cos(2*pi*x1(i)+cos(2*pi*x2(i)))/2)) + 20 + exp(1); %ackley function
%g(i) = 418.9829*2 - x1(i)*sin(sqrt(abs(x1(i)))) - x2(i)*sin(sqrt(abs(x2(i)))); %schwefel f







