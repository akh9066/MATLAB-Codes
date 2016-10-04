function AMatrixTest()

clear variables
close all

rng shuffle

func = 'easom';
basis = 'polar';
rowSamp = 'convex'; 

scale = 80; 

K = 20; %No. of basis functions/2
p = 15;
q = 15;
ntheta = 20;

probConstr = 1;

[Q,A,g,x1pt,x2pt,npt,x1,x2,step,dom] = genQA(func,basis,scale,K,p,q,ntheta);

%shuffle Q
%Q = Q(:,randperm(size(Q,2)));

for i = 2:npt-1 %Random walk constraints
    
    if (mod(i,x1pt) ~= 0) && (mod(i,x1pt) ~= 1) && (i > x1pt+1) && (i < npt-x1pt)
        
        %         A(2*i-1,:) = 2*Q(i,:)-Q(i+x1pt+1,:)-Q(i-x1pt-1,:);
        %         A(2*i,:) = 2*Q(i,:)-Q(i+x1pt-1,:)-Q(i-x1pt+1);
        
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

c = ones(npt,1);
f = -c'*Q;

b = [zeros(2*npt,1);g];

A = [A;Q];
AMatrix = [A b;f 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch rowSamp   
    
    case 'all'
        nrowSamp = 3*npt;
        for i = 1:nrowSamp
            if (rand() > probConstr)
                AMatrix(i,:) = 0;
            end
        end
        
    case 'convex'
        nrowSamp = 2*npt;
        for i = 1:nrowSamp
            if (rand() > probConstr)
                AMatrix(i,:) = 0;
            end
        end
     
    case '1/3'      
        for i = 1:npt
            AMatrix(randi([0 2])*npt+i,:) = 0;
        end
        
    otherwise         
        error('Not a valid sampling type')

end
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%

delete('/Users/shettyakhil/Dropbox/ConvexEnvelope/AMatrixTest/*.txt');
delete('/Users/shettyakhil/Dropbox/ConvexEnvelope/rVecTest/*.txt');
csvwrite(sprintf('/Users/shettyakhil/Dropbox/ConvexEnvelope/AMatrixTest/%s_%s.txt',func,basis),AMatrix);

 'Completed generation of AMatrix'
% 
% pause(30);

%%
file = dir('/Users/shettyakhil/Dropbox/ConvexEnvelope/rVecTest/*.txt');
filename = sprintf('/Users/shettyakhil/Dropbox/ConvexEnvelope/rVecTest/%s',file.name);
r = csvread(filename);

size(r)
size(Q)
u = Q*r;
U = reshape(u,x1pt,x2pt)';
F = reshape(g,x1pt,x2pt)';

x1grid = [dom(1):step:dom(3)];
x2grid = [dom(2):step:dom(4)];

figure();
surf(x1grid,x2grid,F);
figure();
surf(x1grid,x2grid,U);

% direction = [0 0 1];
% rotate(surf(x1grid,x2grid,U),direction,90)
plotMinMax(x1grid,x2grid,U);

%%%% save fig %%%%
% switch basis
%     
%     case 'lin'
%         savefig(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsFig/%s_%s_K%d_prob%f.fig',func,basis,K,probConstr));
%         print(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsPNG/%s_%s_K%d_prob%f.png',func,basis,K,probConstr), '-dpng');
%     
%     case 'polar'
%         savefig(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsFig/%s_%s_K%d_ntheta%d_prob%f.fig',func,basis,K,ntheta,probConstr));
%         print(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsPNG/%s_%s_K%d_ntheta%d_prob%f.png',func,basis,K,ntheta,probConstr), '-dpng');
%         
%     case 'asym'
%         savefig(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsFig/%s_%s_p%d_q%d_prob%f.fig',func,basis,p,q,probConstr));
%         print(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsPNG/%s_%s_p%d_q%d_prob%f.png',func,basis,p,q,probConstr), '-dpng');
%     
%     case 'linasym'
%         savefig(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsFig/%s_%s_K%d_p%d_q%d_prob%f.fig',func,basis,K,p,q,probConstr));
%         print(sprintf('/Users/shettyakhil/Desktop/MATLAB/Convex Envelope/SurfPlotsPNG/%s_%s_K%d_p%d_q%d_prob%f.png',func,basis,K,p,q,probConstr), '-dpng');
%         
% end
        
        
        
% direction = [0 0 1];
% rotate(surf(x1grid,x2grid,U),direction,90)
