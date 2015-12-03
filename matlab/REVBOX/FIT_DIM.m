function FIT_DIM(alpha, D, titleString) %alphaMax, alphaMin,

%D = log(D);
%alpha = log(alpha);
%alphaMax = log(alphaMax);
%alphaMin = log(alphaMin);
[p, ErrorEst] = polyfit(D, alpha,1);
fitpoints = polyval(p, D, ErrorEst);

figure
hold on
[D_sorted, order] = sort(D);
fitpoints_sorted = fitpoints(order);
plot(D_sorted, fitpoints_sorted, 'r-');
%plot(D, fitpoints, 'b-');
plot(D, alpha, 'b.');
%errorbar(D, alpha, alphaMin, alphaMax, 'bx');
xlabel('D');
ylabel('alpha');
title(titleString);
hold off
end