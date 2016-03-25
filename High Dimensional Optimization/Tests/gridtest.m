m = 3;      %mXm grid
n = m^2;
%np = 1; %noise parameter
syms x1 x2; 

%%%% Working with 2-D domain functions 
%%%% Set of Test Functions (Uncomment whichever function needs to be used)%
f = - (1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2); %Drop wave function
%f = -0.0001*(abs(sin(x1)sin(x2)exp(abs(100-sqrt(x1^2+x2^2)/pi)))+1)^0.1;

%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g = gradient(f, [x1 x2]);

%dom represents domain with each row denoting range of corr dimension
dom = [-5.12 5.11; -5.12 5.11];

x = [dom(1,1):-2*dom(1,1)/n:dom(1,2); dom(2,1):-2*dom(2,1)/n:dom(2,2)].'; %initializing x 
tpm = gentpm('I', m); % setting type of gossip matrix

niter = 1000;

for k = 1:niter
    k
    xmod = x + npstep(k)*xnoise(k+1,n);    %adding noise to avoid local minima
    x1 = xmod(:,1);
    x2 = xmod(:,2);
    gradf = double([subs(g(1)) subs(g(2))]) %gradient matrix
    x = tpm*x - stepsize(k)*gradf; %non-linear gossip iteration
end

