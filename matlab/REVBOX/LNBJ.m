function r = LNBJ(K,N,alpha,j)

r = gammaln(K+j+1) - gammaln(j+1) - gammaln(K+1) + ...
    + betaln((K+j)*alpha, N) - betaln(K*alpha,N);

end