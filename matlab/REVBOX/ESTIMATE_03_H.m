function [ HMean, H ] = ESTIMATE_03_H(cellNvec, nA, A, nR, alpha)
%ESTIMATE_03_H odhad entropie ze zadaných vygenerovaných dat a zadané aplha
    H = zeros(nA, nR);
    parfor j=1:nR
        for i=1:nA  
            Nvec = cellNvec(j,i); Nvec = Nvec{1};
            if(alpha==0) 
                K = sum(Nvec>0);
                H(i,j) = log(K); 
            else
                H(i,j) = HARTLEYBAYES(Nvec, alpha);
            end            
            disp(['     rotace: ' num2str(j) ' mrizka velikosti: ' num2str(A(i))]);
        end
    end
    HMean = mean(H,2)';
end

