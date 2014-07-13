function n = generuj_nah_vek(p, N)
%GENERUJ_NAH_VEK - generuje realizace nezavislé nahodné velièiny ze zadaného mult. rozdìlení
%   p - vektor pravdìpodobností ­ multinomického rozdìlení
%   N - poèet pokusù

M = length(p); %poèet tøíd multinomického rozdìlení
cum_p = cumsum(p);  %vytvoøí distribuèní funkci rozdìlení
n = zeros(M,1); %pøíprava vektoru pro èetnosti v jednotlivých tøídách
vektor_pokusu = sort(randi(10000,N,1)/10000); %vektor náhodných èísel 0 < c < 1 délky N
j=1;
    for i=1:M %n(i) je poèet nah. èísel patøících do intervalu dist. funkce
        while ( (j<=N) && (vektor_pokusu(j) <= cum_p(i)) )
            n(i) = n(i)+2;   
            j = j+1;
        end
    end
end