clear all
syms x1 x2;
%%%% Working with 2-D domain functions 
%%%% Set of Test Functions (Uncomment whichever function needs to be used)%
%f = -5*(1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2); %Drop wave function
%f = (2*x1+x2-7)^2 + (x1+2*x2-5)^2;% booth function
%f = (10*2 + (x1^2-10*cos(2*pi*x1)) + (x2^2 -10*cos(2*pi*x2))); %rastrigin
%f = 2*x1^2 + -1.05*x1^4 + x1^6/6 +x1*x2 +x2^2; %three hump camel
%bukin function
%f = -0.0001*(abs(sin(x1)sin(x2)exp(abs(100-sqrt(x1^2+x2^2)/pi)))+1)^0.1;
%f = ((1-x1)^2 + 100*(x2-x1^2)^2)/1000; %rosenbrock fn
f = 5*(1 + (x1^2+x2^2)/4000 - cos(x1)*cos(x2/sqrt(2)));%griewank fn
%f = (418.9829*2 - (x1*sin(x1) + x2*sin(sqrt(abs(x2)))))/2; %schwefel fn


%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dom = [-5 5; -5 5];
dom = [-10 10;-10 10];
step = 0.5;
h = step*sqrt(2);
x1 = repmat([dom(1):step:dom(3)],(dom(3)-dom(1))/step +1,1);
x2 = repmat([dom(2):step:dom(4)]',1,(dom(4)-dom(2))/step +1);

F = double(subs(f));
u = F;
niter = 100;

%9 point stencil
for iter = 1:niter
    iter
    for i = 2:(dom(3)-dom(1))/step 
        for j = 2:(dom(4)-dom(2))/step 

            eigmin = inf;

            eigvalue = (u(i+1,j)+u(i-1,j))/2;
            if eigvalue < eigmin
                eigmin = eigvalue;
            end 

            eigvalue = (u(i+1,j+1)+u(i-1,j-1))/2;
            if eigvalue < eigmin
                eigmin = eigvalue;
            end

            eigvalue = (u(i,j+1)+u(i,j-1))/2;
            if eigvalue < eigmin
                eigmin = eigvalue;
            end 

            eigvalue = (u(i-1,j+1)+u(i+1,j-1))/2;
            if eigvalue < eigmin
                eigmin = eigvalue;
            end 

            if eigmin < u(i,j)  
                u(i,j) = eigmin;
            end 
            
        end
    end
end
<<<<<<< HEAD
% figure()
% surf(x1,x2,F);
=======
figure()
surf(x1,x2,F);
>>>>>>> 0b6f1e4d24487e8cc718e48d81c82ab7ebf80da5
figure()
surf(x1,x2,u);
            
           
            
            
            
        
        
       




