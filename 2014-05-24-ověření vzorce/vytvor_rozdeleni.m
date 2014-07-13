function p = vytvor_rozdeleni(M,Rand)
%VYTVOR_ROZDELENI vygeneruje rozložení pravdìpodobností mult. rozdìlení
%   M - poèet tøíd mult. rozdìlení
%   Rand - pro Rand == 0 se nastaví hodnoty vektoru natvrdo na 1/M
%          pro Rand == 1 probìhne náhodné generování z rovnomìrného roz.
%          pro ostatní náhodné generování z normálního roz.

if Rand == 0
    p = ones(M,1)/M;
else
    if Rand ==1
        p = rand(M,1);
    else
        p = abs(randn(M,1)).^2;
    end
    p = p/sum(p);
end
end