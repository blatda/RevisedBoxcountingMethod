% SCRIPTSTAT

% potrebuje H z SCRIPTPLOT nebo SCRIPTPLOT1

%H = H';

[a b] = size(H);

STAT = zeros(b,3);

for i=1:b
    STAT(i,1) = mean(H(:,i));
    STAT(i,2) = std(H(:,i));

    SSQ = sum((H(:,i)-STAT(i,1)).^2);
    Se = sqrt(SSQ/(a-2));
    X = MNCLIN( log(A)', H(:,i) );
    t = (abs(X(1) - dim)/Se)*sqrt((sum(H(i,:)-STAT(i,1)).^2 ));
    p = tcdf(t, a-2);
    STAT(i,3) = 2 - 2*p;
    
    
end
