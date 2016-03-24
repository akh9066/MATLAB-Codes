clear all
tic
seed = random_graph(5);
nodes = 500; %no. of actors
plays = 10;
%nlimit = 2;

niter = 1000;
l = 1; % listening prob
a = 1; % accepting prob
s = 0.2; % self prob

avgit = 10; %no. of iterations per set of parameters
nlim = 10; %max pref attachment tested

crarray = zeros(nlim, 2); % Column 1 is nlimit, Column 2 is number of new creative nodes
crarray(:,1) = 1:nlim;
for nlimit = 1:nlim
    p = sqrt(2*nlimit/(nodes*plays));
    for crit = 1:avgit    
        iteration = (nlimit-1)*avgit + crit
        toc 
        tic
        crarray(nlimit,2) = crarray(nlimit,2) + fmodel1(seed, nodes, nlimit, niter, l, s, a, 'BP', plays, p);   
    end
    
    crarray(nlimit, 2) = crarray(nlimit, 2)/avgit;
end
toc

figure();
plot(crarray(:,1), crarray(:,2));
% savefig(sprintf('%d_%d_%d_%f.fig',nodes, nlim, avgit, s));
% load handel;
% sound(y, Fs);
save('crarray_BP_modaccept_selflisten_500_10_10.mat', 'crarray');

