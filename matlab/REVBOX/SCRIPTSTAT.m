% SCRIPTSTAT

% potrebuje H z SCRIPTPLOT nebo SCRIPTPLOT1

%H = H';

[a b] = size(H);

STAT = zeros(a,3);

for i=1:a
    STAT(i,1) = mean(H(i,:));
    STAT(i,2) = std(H(i,:));

    SSQ = sum((H(i,:)-STAT(i,1)).^2);
    Se = sqrt(SSQ/(b-2));
    [ ED, bcon ] = MNCLIN( log(A), H(i,:) );
    t = (abs(ED - dim)/Se)*sqrt((sum(H(i,:)-STAT(i,1)).^2 ));
    [h, p] = tcdf(t, b-2);
    STAT(i,3) = 2 - 2*p;
    
    
end
