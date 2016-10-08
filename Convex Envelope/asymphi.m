function Q = asymphi(dom,step,A,B)

x1rng = dom(3)-dom(1);
x2rng = dom(4)-dom(2);
x1pt = x1rng/step +1;
x2pt = x2rng/step +1;
npt = x1pt*x2pt;
x1 = repmat([dom(1):step:dom(3)]',x2pt,1);

x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);

Q = zeros(npt,4*A*B);

for l = 1:2:2*B-1    
    for i = 1:2:2*A-1     %x1 - Bas is function index
        for j = 1:npt   %Basis function value index
            if (x1(j) > dom(1) + (i-1)*(dom(3)-dom(1))/(2*A))&&(x2(j) > dom(2) + (l-1)*(dom(4)-dom(2))/(2*B))
                Q(j,(l-1)*2*A+i) = (x1(j) - (dom(1) + (i-1)*(dom(3)-dom(1))/(2*A)))*(x2(j) - (dom(2) + (l-1)*(dom(4)-dom(2))/(2*B)));
            else
                Q(j,(l-1)*2*A+i) = 0;
            end
        end
    end

    for i = 2:2:2*A
        for j=1:npt
            if (x1(j) < (2*A-i+2)*(dom(3)-dom(1))/(2*A))&&(x2(j) > dom(2) + (l-1)*(dom(4)-dom(2))/(2*B))
                 Q(j,(l-1)*2*A+i) = (-x1(j) + (2*A-i+2)*(dom(3)-dom(1))/(2*A))*(x2(j) - (dom(2) + (l-1)*(dom(4)-dom(2))/(2*B)));
            else 
               Q(j,(l-1)*2*A+i) = 0;
            end
        end
    end
end

for l = 2:2:2*B   
    for i = 1:2:2*A-1     %x1 - Bas is function index
        for j = 1:npt   %Basis function value index
            if (x1(j) > dom(1) + (i-1)*(dom(3)-dom(1))/(2*A))&&(x2(j) < (2*B-l+2)*(dom(4)-dom(2))/(2*B))
                Q(j,(l-1)*2*A+i) = (x1(j) - (dom(1) + (i-1)*(dom(3)-dom(1))/(2*A)))*(-x2(j) + (2*B-l+2)*(dom(4)-dom(2))/(2*B));
            else
                Q(j,(l-1)*2*A+i) = 0;
            end
        end
    end

    for i = 2:2:2*A
        for j=1:npt
            if (x1(j) < (2*A-i+2)*(dom(3)-dom(1))/(2*A))&&(x2(j) < (2*B-l+2)*(dom(4)-dom(2))/(2*B))
                 Q(j,(l-1)*2*A+i) = (-x1(j) + (2*A-i)*(dom(3)-dom(1))/(2*A))*(-x2(j) + (2*B-l+2)*(dom(4)-dom(2))/(2*B));
            else 
               Q(j,(l-1)*2*A+i) = 0;
            end
        end
    end
end


    

    

    
