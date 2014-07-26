function [ counter ] = BOXCOUNT( X, a, posun)

eps = 0.00001;

if nargin==2 || posun==0
    posun = zeros(1,size(X,2));
else
    posun = a*rand(1,size(X,2));
end

posun = posun+eps;

%X = (X-1)/max(X(:)-1);
X = X./max(X(:)+1);

for i=1:size(X,1)
    X(i,:)=X(i,:)+posun;
end


counter=zeros(X(1,:)*0+ceil(1/a)+2);

switch size(X,2)
    case 1
        for i=1:size(X,1)
            counter(ceil(X(i)/a))=counter(ceil(X(i)/a))+1;
        end
    case 2
        for i=1:size(X,1)
            counter(ceil(X(i,1)/a),ceil(X(i,2)/a))=counter(ceil(X(i,1)/a),ceil(X(i,2)/a))+1;
        end
    case 3
        for i=1:size(X,1)
            counter(ceil(X(i,1)/a),ceil(X(i,2)/a),ceil(X(i,3)/a))=counter(ceil(X(i,1)/a),ceil(X(i,2)/a),ceil(X(i,3)/a))+1;
        end
end
    
counter = counter(:);
counter = counter(counter~=0);


end

