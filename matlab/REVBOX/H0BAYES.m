function [ H ] = H0BAYES( maxj, K, N)
%H0BAYES

bold = 1;
up = bold*log(K);
bot = bold;
d = 1;
for j=1:maxj
    bold = ((1/j)*((K+j)*(K+j-1))/(K+N+j-1))*bold;
    if isinf(up + bold*log(K+j))
        j
        break
    end
    up = up + bold*log(K+j)/d;
    bot = bot + bold/d;
end

H = up/bot;

end

