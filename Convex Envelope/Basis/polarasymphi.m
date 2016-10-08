function Q = polarasymphi(dom,step,K,p,q,ntheta)

Qpolar = polarphi(dom,step,K,ntheta);
Qasym = asymphi(dom,step,p,q);

Q = [Qasym Qpolar];

