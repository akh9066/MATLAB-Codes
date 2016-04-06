function np = npstep(k)

%np = 1/k;
%np = 1/(1+floor(k/10));
np = 1/((1+2.5e3)^k);
