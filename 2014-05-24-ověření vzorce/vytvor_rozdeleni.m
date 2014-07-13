function p = vytvor_rozdeleni(M,Rand)
%VYTVOR_ROZDELENI vygeneruje rozlo�en� pravd�podobnost� mult. rozd�len�
%   M - po�et t��d mult. rozd�len�
%   Rand - pro Rand == 0 se nastav� hodnoty vektoru natvrdo na 1/M
%          pro Rand == 1 prob�hne n�hodn� generov�n� z rovnom�rn�ho roz.
%          pro ostatn� n�hodn� generov�n� z norm�ln�ho roz.

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