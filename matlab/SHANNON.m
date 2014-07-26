function T=SHANNON(p)
p=p(p>0);
T=-sum(p.*log(p));