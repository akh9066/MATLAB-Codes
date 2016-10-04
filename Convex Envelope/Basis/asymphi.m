function Q = asymphi(dom,step,p,q)

x1rng = dom(3)-dom(1);
x2rng = dom(4)-dom(2);
x1pt = x1rng/step +1;
x2pt = x2rng/step +1;
npt = x1pt*x2pt;
x1 = repmat([dom(1):step:dom(3)]',x2pt,1);

x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);

Q = zeros(npt,4*p*q);

for l = 1:2:2*q-1    
    for i = 1:2:2*p-1     %x1 - qas is function index
        for j = 1:npt   %Basis function value index
            if (x1(j) > dom(1) + (i-1)*(dom(3)-dom(1))/(2*p))&&(x2(j) > dom(2) + (l-1)*(dom(4)-dom(2))/(2*q))
                Q(j,(l-1)*2*p+i) = (x1(j) - (dom(1) + (i-1)*(dom(3)-dom(1))/(2*p)))*(x2(j) - (dom(2) + (l-1)*(dom(4)-dom(2))/(2*q)));
            else
                Q(j,(l-1)*2*p+i) = 0;
            end
        end
    end

    for i = 2:2:2*p
        for j=1:npt
            if (x1(j) < (2*p-i+2)*(dom(3)-dom(1))/(2*p))&&(x2(j) > dom(2) + (l-1)*(dom(4)-dom(2))/(2*q))
                 Q(j,(l-1)*2*p+i) = ((2*p-i+2)*(dom(3)-dom(1))/(2*p) -x1(j) -dom(1))*(x2(j) - (dom(2) + (l-1)*(dom(4)-dom(2))/(2*q)));
            else 
               Q(j,(l-1)*2*p+i) = 0;
            end
        end
    end
end

for l = 2:2:2*q   
    for i = 1:2:2*p-1     %x1 - Bas is function index
        for j = 1:npt   %Basis function value index
            if (x1(j) > dom(1) + (i-1)*(dom(3)-dom(1))/(2*p))&&(x2(j) < (2*q-l+2)*(dom(4)-dom(2))/(2*q))
                Q(j,(l-1)*2*p+i) = (x1(j) - (dom(1) + (i-1)*(dom(3)-dom(1))/(2*p)))*((2*q-l+2)*(dom(4)-dom(2))/(2*q) - x2(j) - dom(2));
            else
                Q(j,(l-1)*2*p+i) = 0;
            end
        end
    end

    for i = 2:2:2*p
        for j=1:npt
            if (x1(j) < (2*p-i+2)*(dom(3)-dom(1))/(2*p))&&(x2(j) < (2*q-l+2)*(dom(4)-dom(2))/(2*q))
                 Q(j,(l-1)*2*p+i) = ((2*p-i+2)*(dom(3)-dom(1))/(2*p) -x1(j) -dom(1))*((2*q-l+2)*(dom(4)-dom(2))/(2*q) - x2(j) - dom(2));
            else 
               Q(j,(l-1)*2*p+i) = 0;
            end
        end
    end
end

% x1grid = dom(1):step:dom(3);
% x2grid = dom(2):step:dom(4);
% 
% figure();
% for basisIt = 1:4*p*q
%     QMatrix = reshape(Q(:,basisIt),x1pt,x2pt);
%     surf(x1grid,x2grid,QMatrix);
%     %direction = [0 0 1];
%     %rotate(surf(x1grid,x2grid,QMatrix),direction,180);
%     pause(5);
% end

%Q = asymphi([-5 5;-5 5],0.25,2,2); 
    

    

    
