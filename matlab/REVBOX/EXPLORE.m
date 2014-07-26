function [ R, SSQ ] = EXPLORE(H, A, step, dim, print )

if nargin == 4
    print = 1;
end

N = size(H,2);
M = size(H,1);

R = zeros(2,M-step+1);
SSQ = zeros(2,M-step+1);

if print > 0
    figure
    hold on
end

for i=[1, N]
    %figure
    
    for j=1:M-step+1
        %[ aa, bb ] = MNCLIN( log(A(j:j+step-1)), H(j:j+step-1,i)' );
        [D, sD, ssq] = MNC( H(j:j+step-1,i), log(A(j:j+step-1)), dim);
        R(i,j) = D; 
        SSQ(i,j) = ssq; 
    end
    
    if print > 0 
        plot(A(1:end-step+1),R(i,:), 'Color', [2-i i-1 0])
        plot([A(1), A(end-step+1)], [dim, dim])
    end
   
end

if print > 0
    hold off
end

%figure
%plot(A(1:end-step+1),R(1,:)-R(2,:))


end

