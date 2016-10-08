function [Q,A,g,x1pt,x2pt,npt,x1,x2,step,dom] = genQA(func,basis,scale,K,p,q,ntheta)

switch func
    
    case 'rastrigin'
        dom = [-5 5; -5 5]; 
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = 10*2 + x1(i)^2-10*cos(2*pi*x1(i)) + x2(i)^2 -10*cos(2*pi*x2(i)); %rastrigin
        end
        
    case 'griewank'
        dom = [-10 10; -10 10]; 
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = 1 + (x1(i)^2+x2(i)^2)/4000 - cos(x1(i))*cos(x2(i)/sqrt(2));
        end
        
    case 'levy'
        dom = [-10 10; -10 10]; 
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            w1 = 1 + (x1(i)-1)/4;
            w2 = 1 + (x2(i)-1)/4;
            g(i) = sin(pi*w1)^2 + (w1-1)^2*(1+10*sin(pi*w1+1)^2) + (w2-1)^2*(1+sin(2*pi*w2)^2);
        end
        
     case 'levyn13'
        dom = [-10 10; -10 10]; 
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = sin(3*pi*x1(i))^2 + (x1(i)-1)^2*(1+sin(3*pi*x2(i))^2) + (x2(i)-1)^2*(1+sin(2*pi*x2(i))^2);
        end
   
    case 'eggholder'
        dom = [-512 512; -512 512]; 
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = -(x2(i)+47)*sin(sqrt(abs(x2(i)+x1(i)/2+47))) - x1(i)*sin(sqrt(abs(x1(i)-(x2(i)+47)))) + 1000; %+ 1000
        end    
        
    case 'ackley'
        dom = [-40 40;-40 40];
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = -20*exp(-0.2*sqrt((x1(i)^2+x2(i)^2)/2)) - exp((cos(2*pi*x1(i)+cos(2*pi*x2(i)))/2)) + 20 + exp(1); %ackley function
        end
        
    case 'michalewicz'
        dom = [0 4;0 4];
        m = 10;
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
           g(i) = - sin(x1(i))*sin(x1(i)^2/pi)^(2*m) - sin(x2(i))*sin(2*x2(i)^2/pi)^(2*m) + 5; %+5
        end
    
    case 'easom'
        dom = [-20 20;-20 20];
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = -cos(x1(i))*cos(x2(i))*exp(-(x1(i)-pi)^2 - (x2(i)-pi)^2)+2; %+2
        end
        
    case 'rosenbrock'
        dom = [-2 2;-2 2];
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = 100*(x2(i)-x1(i)^2)^2 + (x1(i)-1)^2;
        end
    
    case 'dropwave'
        dom = [-5 5;-5 5];
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = -(1+cos(12*sqrt(x1(i)^2+x2(i)^2)))/(0.5*(x1(i)^2+x2(i)^2)+2) + 1; %+1
        end
        
    case 'schwefel'
        dom = [-500 500;-500 500];
        [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale);
        g = zeros(npt,1);
        for i = 1:npt
            g(i) = 418.9829*2 - x1(i)*sin(sqrt(abs(x1(i)))) - x2(i)*sin(sqrt(abs(x2(i))));
        end
        
    otherwise 
        error('Not a valid function name');
     
     
end

switch basis
    
    case 'lin'
        Q = linphi(dom,step,K);
        A = zeros(2*npt,2*K);
    case 'para'
        Q = paraphi(dom,step,K);
        A = zeros(2*npt,2*K);
    case 'asym'
        Q = asymphi(dom, step, p, q);
        A = zeros(2*npt,4*p*q);
    case 'polar'
        Q = polarphi(dom,step,K,ntheta);
        A = zeros(2*npt,2*K*ntheta);      
    case 'polarneg'
        Q = polarnegphi(dom,step,K,ntheta);
        A = zeros(2*npt,4*K*ntheta);
    case 'linasym'
        Q = linasymphi(dom,step,K,p,q);
        A = zeros(2*npt,2*K+4*p*q);
    case 'linasymneg'
        Q = linasymnegphi(dom,step,K,p,q);
        A = zeros(2*npt,2*(2*K+4*p*q));
    case 'polarasym'
        Q = polarasymphi(dom,step,K,p,q,ntheta);
        A = zeros(2*npt,4*p*q+2*K*ntheta);
    otherwise 
        error('Not a valid basis name');

end



        
%g(i) = 5*(1 + (x1(i)^2+x2(i)^2)/4000 - cos(x1(i))*cos(x2(i)/sqrt(2))); %griewank function
%g(i) = -(1+cos(12*sqrt(x1(i)^2+x2(i)^2)))/(0.5*(x1(i)^2+x2(i)^2)+2); %Dropwave function
%g(i) = (2*x1(i)+x2(i)-7)^2 + (x1(i)+2*x2(i)-5)^2;% booth function
%g(i) = (1-x1(i))^2 + 100*(x2(i)-x1(i)^2)^2; %rosenbrock fn
%g(i) = -20*exp(-0.2*sqrt((x1(i)^2+x2(i)^2)/2)) - exp((cos(2*pi*x1(i)+cos(2*pi*x2(i)))/2)) + 20 + exp(1); %ackley function
%g(i) = 418.9829*2 - x1(i)*sin(sqrt(abs(x1(i)))) - x2(i)*sin(sqrt(abs(x2(i)))); %schwefel f

%dom = [-10 10;-10 10]; %griewank 
%dom = [-5 5; -5 5];    %rastrigin, dropwave
%dom = [-40 40;-40 40]; %ackley
%dom = [-500 500; -500 500]; %schwefel
%dom = [-10 10;-6 6];


