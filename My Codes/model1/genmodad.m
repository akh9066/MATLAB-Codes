function [modad, cr] = genmodad(modad, cr, s) 

%%% Fading 

nrows = length(modad(1,:));
nodeid = (cr-1)*(nrows+1)+1; %Finding 1-d index of old creative nodes
modad(nodeid) = 0; %Setting these nodes to zero, i.e fading

%%% Generation
noncr = find(~diag(modad));  %noncr is the list of non-creative nodes at present 

for k = 1:length(noncr)
    modad(noncr(k),noncr(k)) = logical(rand()<s);
end

cr = find(diag(modad)); % cr is the new list of creative nodes after self generation of ideas with
% probability s 

% The resulting modad will be the new modad matrix at start of epoch

