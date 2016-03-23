function problist = problisten(modad, i, l)

deg = degad(modad, i); 
%problist = deg^(-l);
problist = 1/(1+deg^l);
