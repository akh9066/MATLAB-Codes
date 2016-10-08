<<<<<<< HEAD
clear variables
close all

rng shuffle
=======
clear all
%syms x1 x2;

%%%% Working with 2-D domain functions 
%%%% Set of Test Functions (Uncomment whichever function needs to be used)%
%f = -5*(1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2); %Drop wave function
%f = (2*x1+x2-7)^2 + (x1+2*x2-5)^2;% booth function
%f = (10*2 + (x1^2-10*cos(2*pi*x1)) + (x2^2 -10*cos(2*pi*x2))); %rastrigin
%f = 2*x1^2 + -1.05*x1^4 + x1^6/6 +x1*x2 +x2^2; %three hump camel
%bukin function
%f = -0.0001*(abs(sin(x1)sin(x2)exp(abs(100-sqrt(x1^2+x2^2)/pi)))+1)^0.1;
%f = ((1-x1)^2 + 100*(x2-x1^2)^2)/1000; %rosenbrock fn
%f = 5*(1 + (x1^2+x2^2)/4000 - cos(x1)*cos(x2/sqrt(2)));%griewank fn
%f = (418.9829*2 - (x1*sin(x1) + x2*sin(sqrt(abs(x2)))))/2; %schwefel fn


%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5

%dom = [-10 10;-10 10]; %griewank 
dom = [-5 5; -5 5];    %rastrigin, dropwave
%dom = [-40 40;-40 40]; %ackley
%dom = [-500 500; -500 500]; %schwefel
%dom = [-10 10;-6 6];

<<<<<<< HEAD
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


=======
step = 0.25;
K = 20; %No. of basis functions/2
A = 10;
B = 10;

x1rng = dom(3) - dom(1);
x2rng = dom(4) - dom(2);
x1pt = x1rng/step + 1;
x2pt = x2rng/step + 1;
npt = x1pt*x2pt;

x1 = repmat([dom(1):step:dom(3)]',x2pt,1);
x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);

%g = double(subs(f));
g = zeros(npt,1);
for i = 1:npt
    g(i) = 10*2 + x1(i)^2-10*cos(2*pi*x1(i)) + x2(i)^2 -10*cos(2*pi*x2(i)); %rastrigin 
    %g(i) = 5*(1 + (x1(i)^2+x2(i)^2)/4000 - cos(x1(i))*cos(x2(i)/sqrt(2))); %griewank function
    %g(i) = -(1+cos(12*sqrt(x1(i)^2+x2(i)^2)))/(0.5*(x1(i)^2+x2(i)^2)+2); %Dropwave function
    %g(i) = (2*x1(i)+x2(i)-7)^2 + (x1(i)+2*x2(i)-5)^2;% booth function
    %g(i) = (1-x1(i))^2 + 100*(x2(i)-x1(i)^2)^2; %rosenbrock fn
    %g(i) = -20*exp(-0.2*sqrt((x1(i)^2+x2(i)^2)/2)) - exp((cos(2*pi*x1(i)+cos(2*pi*x2(i)))/2)) + 20 + exp(1); %ackley function
    %g(i) = 418.9829*2 - x1(i)*sin(sqrt(abs(x1(i)))) - x2(i)*sin(sqrt(abs(x2(i)))); %schwefel fn
end

c = ones(npt,1);
%Q = linphi(dom,step,K);
%Q = paraphi(dom,step,K);
Q = asymphi(dom, step, A, B);

%A = zeros(2*npt,2*K);
A = zeros(2*npt,4*A*B);

f = -c'*Q;
Aeq = [];
beq = [];

nconst = 0;
for i = x1pt+2:npt-x1pt-1 %Random walk constraints
    if (mod(i,x1pt) ~= 0) && (mod(i,x1pt) ~= 1) && (rand()<1)    
        
        A(2*i-1,:) = 2*Q(i,:)-Q(i+x1pt+1,:)-Q(i-x1pt-1,:);
        A(2*i,:) = 2*Q(i,:)-Q(i+x1pt-1,:)-Q(i-x1pt+1);      
        nconst = nconst+1;
    end
end 

f = -c'*Q;
Aeq = [];
beq = [];
A = [A;Q];
b = [zeros(2*npt,1);g];

>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
tic
r = linprog(f,A,b);
toc

u = Q*r;
U = reshape(u,x1pt,x2pt)';
F = reshape(g,x1pt,x2pt)';

<<<<<<< HEAD
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



=======
x1mesh = repmat([dom(1):step:dom(3)],x2pt,1);
x2mesh = repmat([dom(2):step:dom(4)]',1,x1pt);

figure();
surf(x1mesh,x2mesh,F);
figure();
surf(x1mesh,x2mesh,U);
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5




<<<<<<< HEAD
=======
    
    
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
