function [swq, cc, pl] = smallworldq(adgraph)

[pl,~,cc,~,~,~] = graphProperties(adgraph);
swq = cc/pl;

