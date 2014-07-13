function n = generuj_nah_vek(p, N)
%GENERUJ_NAH_VEK - generuje realizace nezavisl� nahodn� veli�iny ze zadan�ho mult. rozd�len�
%   p - vektor pravd�podobnost� � multinomick�ho rozd�len�
%   N - po�et pokus�

M = length(p); %po�et t��d multinomick�ho rozd�len�
cum_p = cumsum(p);  %vytvo�� distribu�n� funkci rozd�len�
n = zeros(M,1); %p��prava vektoru pro �etnosti v jednotliv�ch t��d�ch
vektor_pokusu = sort(randi(10000,N,1)/10000); %vektor n�hodn�ch ��sel 0 < c < 1 d�lky N
j=1;
    for i=1:M %n(i) je po�et nah. ��sel pat��c�ch do intervalu dist. funkce
        while ( (j<=N) && (vektor_pokusu(j) <= cum_p(i)) )
            n(i) = n(i)+2;   
            j = j+1;
        end
    end
end