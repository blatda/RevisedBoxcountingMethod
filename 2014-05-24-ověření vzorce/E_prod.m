%statistické ovìøení rovnice (34)

O = 100000;
n = 4; %

produkty = zeros(1,O);

Ni = [1 2 1 0]';
N = sum(Ni);
K = sum(Ni>0);

P = randfixedsum(n,O,1,0,1);

for i=1:O
    produkty(i) = prod(P(:,i).^Ni);
end

E_e = mean(produkty)                                        %estimated mean value 
E_t = prod(factorial(Ni))*factorial(n-1)/factorial(N+n-1)   %theoretical mean value 
procentualni_chyba = abs(E_e - E_t)/E_t