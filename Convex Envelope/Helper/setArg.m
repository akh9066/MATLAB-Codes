function [x1pt,x2pt,npt,x1,x2,step] = setArg(dom,scale)

x1rng = dom(3) - dom(1);
x2rng = dom(4) - dom(2);
step = min(x1rng/scale,x2rng/scale);
x1pt = x1rng/step + 1;
x2pt = x2rng/step + 1;
npt = x1pt*x2pt;

x1 = repmat([dom(1):step:dom(3)]',x2pt,1);
x2mat = repmat([dom(2):step:dom(4)],x1pt,1);
x2 = reshape(x2mat,npt,1);