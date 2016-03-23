function netWS = genWS(nodes, K, b)
%N*K edges, while comparing with BA set nlimit and K accordingly
%(nlimit~2K)
netWS = WattsStrogatz(nodes,K,b);
