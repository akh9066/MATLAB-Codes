clear all
tic
%seed = random_graph(5);
nodes = 500;
m0 = 20;
%nlimit = 2;

niter = 1000;
l = 1; % listening prob
a = 1; % accepting prob
s = 0.2; % self prob
sp = 5; %ratio of time for self creativity

%%% for bipartite %%%
plays = 10;
p = 0.01;
%%%%%%%%%%%%%%%%%%%%%
avgit = 30; %no. of iterations per set of parameters
nlim = 20; %max pref attachment tested

crarray = zeros(nlim, 2); % Column 1 is nlimit, Column 2 is number of new creative nodes
crarray(:,1) = 1:nlim;
for nlimit = 1:nlim
    for crit = 1:avgit    
        iteration = (nlimit-1)*avgit + crit
        toc 
        tic
        crarray(nlimit,2) = crarray(nlimit,2) + fmodel1(nodes, nlimit, m0, niter, l, s, a, 'BA',plays,p,sp);   
    end
    
    crarray(nlimit, 2) = crarray(nlimit, 2)/avgit;
end
toc

figure();
plot(crarray(:,1), crarray(:,2));
%savefig('crarray_BA_modaccept_sp5listen_500_30_20.fig');
% load handel;
% sound(y, Fs);
%save('crarray_BA_modaccept_sp5listen_500_30_20.mat', 'crarray');

