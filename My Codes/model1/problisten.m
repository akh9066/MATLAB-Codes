function problist = problisten(modad, i, l, sp)
%sp - ratio of time for self creativity
deg = degad(modad, i); 
%problist = deg^(-l);
%problist = 1/(1+deg^l);
problist = 1/(sp+deg^l);