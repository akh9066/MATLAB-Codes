function Q = linasymnegphi(dom,step,K,p,q)

Qlin = linphi(dom,step,K);
Qasym = asymphi(dom,step,p,q);

Qpos = [Qlin Qasym];
Q = [Qpos -Qpos];

