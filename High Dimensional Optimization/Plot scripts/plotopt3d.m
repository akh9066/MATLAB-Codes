
%[x1,x2] = meshgrid(-2:.1:2);
[x1, x2] = meshgrid(-2:.1:2, -2:.1:2);

%f = -(1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2);
figure();
surf(z);
% surf(x1,x2,f);