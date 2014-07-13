%statistické ovìøení rovnice (34)

OP = 10000;
ON = 100;
n = 4; 
N = 4;

produkty = zeros(1,O);



P = randfixedsum(n,OP,1,0,1);
vec_K = zeros(1, min(n,N));

for i=1:OP
    for j=1:ON       
        Ni = generuj_nah_vek(P(:,i),N);
        K = sum(Ni>0);
        vec_K(K) = vec_K(K)+1;
    end
end

pK_e = vec_K/(OP*ON)

pK_t = zeros(size(vec_K));
for i=1:length(vec_K)
    pK_t(i) = nchoosek(n,i)*nchoosek(N-1,i-1)/nchoosek(N+n-1,n-1);
end

pK_t