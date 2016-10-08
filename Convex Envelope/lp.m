clear all
<<<<<<< HEAD
%syms x1 x2;
=======
syms x1 x2;
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
%%%% Working with 2-D domain functions 
%%%% Set of Test Functions (Uncomment whichever function needs to be used)%
%f = -5*(1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2); %Drop wave function
%f = (2*x1+x2-7)^2 + (x1+2*x2-5)^2;% booth function
%f = (10*2 + (x1^2-10*cos(2*pi*x1)) + (x2^2 -10*cos(2*pi*x2))); %rastrigin
%f = 2*x1^2 + -1.05*x1^4 + x1^6/6 +x1*x2 +x2^2; %three hump camel
%bukin function
%f = -0.0001*(abs(sin(x1)sin(x2)exp(abs(100-sqrt(x1^2+x2^2)/pi)))+1)^0.1;
%f = ((1-x1)^2 + 100*(x2-x1^2)^2)/1000; %rosenbrock fn
<<<<<<< HEAD
%f = 5*(1 + (x1^2+x2^2)/4000 - cos(x1)*cos(x2/sqrt(2)));%griewank fn
=======
f = 5*(1 + (x1^2+x2^2)/4000 - cos(x1)*cos(x2/sqrt(2)));%griewank fn
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
%f = (418.9829*2 - (x1*sin(x1) + x2*sin(sqrt(abs(x2)))))/2; %schwefel fn


%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

<<<<<<< HEAD
dom = [-10 10;-10 10];
%dom = [-512 512;-512 512];
%dom = [-5 5; -5 5];
step = 0.5;
=======
%dom = [-10 10;-10 10];
dom = [-5 5; -5 5];
step = 0.25;
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5

x1rng = dom(3) - dom(1);
x2rng = dom(4) - dom(2);
x1pt = x1rng/step + 1;
x2pt = x2rng/step + 1;
npt = x1pt*x2pt;

x1 = repmat([dom(1):step:dom(3)]',x2pt,1);
x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);

<<<<<<< HEAD
g = zeros(npt,1);
for i = 1:npt
    %g(i) = 10*2 + x1(i)^2-10*cos(2*pi*x1(i)) + x2(i)^2 -10*cos(2*pi*x2(i)); %rastrigin 
    g(i) = 1 + (x1(i)^2+x2(i)^2)/4000 - cos(x1(i))*cos(x2(i)/sqrt(2)); %griewank
%     w1 = 1 + (x1(i)-1)/4;
%     w2 = 1 + (x2(i)-1)/4;
    %g(i) = sin(pi*w1)^2 + (w1-1)^2*(1+10*sin(pi*w1+1)^2) + (w2-1)^2*(1+sin(2*pi*w2)^2); %levy 
    %g(i) = sin(3*pi*x1(i))^2 + (x1(i)-1)^2*(1+sin(3*pi*x2(i))^2) + (x2(i)-1)^2*(1+sin(2*pi*x2(i))^2); %levyn13
    %g(i) = -(x2(i)+47)*sin(sqrt(abs(x2(i)+x1(i)/2+47))) - x1(i)*sin(sqrt(abs(x1(i)-(x2(i)+47)))); %eggholder
    
end

f = -ones(npt,1);

%f = zeros(npt,1);
=======
%g = double(subs(f));
g = zeros(npt,1);
for i = 1:npt
    g(i) = 10*2 + x1(i)^2-10*cos(2*pi*x1(i)) + x2(i)^2 -10*cos(2*pi*x2(i)); %rastrigin 
end

f = -ones(npt,1);
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
%f(ceil(npt/2)) = -1;

%f(800) = -1;

Aeq = [];
beq = [];
lb = [];
ub = g;
b = zeros(2*npt,1);

A = zeros(2*npt,npt);
for i = x1pt+2:npt-x1pt-1
    if (mod(i,x1pt) ~= 0) && (mod(i,x1pt) ~= 1)
        A(2*i-1,i) = 2;
        A(2*i-1,i+x1pt+1) = -1;
        A(2*i-1,i-x1pt-1) = -1;
        
        A(2*i,i) = 2;
        A(2*i,i+x1pt-1) = -1;
        A(2*i,i-x1pt+1) = -1;
    end
end

u = linprog(f,A,b,Aeq,beq,lb,ub);

F = reshape(g,x1pt,x2pt)';
U = reshape(u,x1pt,x2pt)';

<<<<<<< HEAD
x1grid = [dom(1):step:dom(3)];
x2grid = [dom(2):step:dom(4)];

figure();
surf(x1grid,x2grid,F);
figure();
surf(x1grid,x2grid,U);

plotMinMax(x1grid,x2grid,U);
=======
x1mesh = repmat([dom(1):step:dom(3)],x2pt,1);
x2mesh = repmat([dom(2):step:dom(4)]',1,x1pt);

figure();
surf(x1mesh,x2mesh,F);
figure();
surf(x1mesh,x2mesh,U);
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
        
        
