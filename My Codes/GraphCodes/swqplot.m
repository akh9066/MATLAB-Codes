seed = random_graph(5);
nodes = 500;
nlimit = 200;

bagraph = genBA(seed, nodes, nlimit);
randgraph = random_graph(nodes, nlimit/nodes);

[swq1, cc1, pl1] = smallworldq(bagraph);
[swq2, cc2, pl2] = smallworldq(randgraph);

cc1
cc2
ccr = cc1/cc2

pl1
pl2
plr = pl1/pl2

swqr = ccr/plr
