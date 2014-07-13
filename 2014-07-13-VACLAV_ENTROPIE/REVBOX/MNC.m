function [D1, sD1, ssq] = MNC( H, x, Ds)


[N,M]=size(H);

%disp('  Est.    D_q   S_dq   Z_score');
for k=1:M
    y=H(:,k)';
    A=[ones(N,1), -x'];
    b=y';
    V=inv(A'*A);
    par=V*A'*b;
    D1=par(2);
    res=A*par-b;
    ssq=sum(res.^2);
    sy=sqrt(ssq/(N-2));
    sD1=sy*sqrt(V(2,2));
    zsD1=(D1-Ds)/sD1;
    %disp('---------');
    %fprintf('%6s & %3.2f & %3.2f & %3.2f \\\\ \n', char(T(k)), D1, sD1, zsD1);
%    fprintf('$ %6f $ & %3.4f & %3.4f & %3.4f \\\\ \n', k, D1, sD1, zsD1);
%    fprintf('\\hline \n');
    %fprintf('%4.2f %4.2f \n', par(1), par(2));  
    %disp([k D1 sD1])
end




end

