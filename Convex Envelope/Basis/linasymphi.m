function Q = linasymphi(dom,step,K,p,q)

Qlin = linphi(dom,step,K);
Qasym = asymphi(dom,step,p,q);

Q = [Qlin Qasym];


