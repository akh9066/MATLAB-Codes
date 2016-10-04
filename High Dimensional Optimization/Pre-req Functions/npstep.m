function np = npstep(k,i)

% if i==1
%     np = 1/k;
% elseif i==2
%     np = 1/(1+floor(k/10));
% elseif i==3
%     np = 1/k^2;
% end 

np = 1/k;
%np = 1/k^2
%np = 1/(1+floor(k/10));
%np = 1/((1+2.5e3)^k);
