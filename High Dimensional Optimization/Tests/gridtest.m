
n = 20;
T = 5;
%np = 1; %noise parameter
syms x1 x2; 
rng(1);

%%%% Working with 2-D domain functions 
%%%% Set of Test Functions (Uncomment whichever function needs to be used)%
%f = -5*(1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2); %Drop wave function
f = (2*x1+x2-7)^2 + (x1+2*x2-5)^2;% booth function
%f = 2*x1^2 + -1.05*x1^4 + x1^6/6 +x1*x2 +x2^2; %three hump camel
%bukin function
%f = -0.0001*(abs(sin(x1)sin(x2)exp(abs(100-sqrt(x1^2+x2^2)/pi)))+1)^0.1;
%f = ((1-x1)^2 + 100*(x2-x1^2)^2)/1000; %rosenbrock fn
%f = 5*(1 + (x1^2+x2^2)/4000 - cos(x1)*cos(x2/sqrt(2)));%griewank fn
%f = (418.9829*2 - (x1*sin(x1) + x2*sin(sqrt(abs(x2)))))/2; %schwefel fn


%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g = gradient(f, [x1 x2]);

%dom represents domain with each row denoting range of corr dimension
%dom = [-5.12 5.11; -5.12 5.11]; %drop wave
dom = [-10 9.99; -10 9.99]; %booth function
%dom = [-5 5.01; -5 5.01]; %rosenbrock
%dom = [-500 499; -500 499];%schwefel

rangex1 = (dom(1,2)-dom(1,1));
rangex2 = (dom(2,2)-dom(2,1));
stepx1 = rangex1/(n-1);
stepx2 = rangex2/(n-1);

%x = [dom(1,1):stepx1:dom(1,2); dom(2,1):stepx2:dom(2,2)].'
x = dom(1,2)*(0.5-rand(n,2));
%initializing x 
%tpm = gentpm('grid', n); % setting type of gossip matrix
F = zeros(n);
niter = 1000;

figure();
h = animatedline;
axis([1 niter 0 10])
tic
for k = 1:niter
    k 
    xmod = x + npstep(k)*xnoise(rangex1/2,n)    %adding noise to avoid local minima
    xmod = boundx(dom(1,1),dom(1,2),xmod); %domain bounded
    x1 = xmod(:,1);
    x2 = xmod(:,2);
    F = double(subs(f));
    tpm = gentpmexp('FC',n,T,F);
    gradf = double([subs(g(1)) subs(g(2))]); %gradient matrix
    x = tpm*x - stepsize(k)*gradf %non-linear gossip iteration
    x = boundx(dom(1,1),dom(1,2),x);
    if mod(k,10)==0
        addpoints(h,k,max(F));
        drawnow
    end
    

end

toc