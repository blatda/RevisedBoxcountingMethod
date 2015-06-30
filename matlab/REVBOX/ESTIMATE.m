%ESTIMATE
%estimate entropy of the fractals
clear all

load Init

nA = length(A);
alpha = 0.2 : 0.1 : 2;
nAlpha = length(alpha);

for k=1:nFRAC   
    cellNvec = load(['cellNvec' num2str(k) '.mat']);
    cellNvec = cellNvec.cellNvec;
    cellH = cell(nR, nA, 2);
    disp(['celkem rozmeru mrizek: ' num2str(nA) '  celkem rotaci: ' num2str(nR)]);
    for j=1:nR  
        disp(['  zacinam odhadovat pro rotaci: ' num2str(j)]);
        for i=1:nA  
            Nvec = cellNvec(j,i); Nvec = Nvec{1};
            K = sum(Nvec>0);                
            cellH(j,i,1) = {log(K)}; 
            V = zeros(1,nAlpha);
            parfor a=1:nAlpha
                V(a) = HARTLEYBAYES(Nvec, alpha(a));
            end
            cellH(j,i,2) = {V(:)};
            disp(['     ' num2str(i) '. mrizka velikosti: ' num2str(A(i))]);
        end
    end     
    save(['cellH' num2str(k) '.mat'], 'cellH');
end

save Init2 alpha nAlpha