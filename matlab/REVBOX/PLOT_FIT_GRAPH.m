A = 2.178; B = -1.571;
X = [0.9 1.6]; Y = A + B*X;
hold on
plot(D_naive, log(alpha_opt),'ko','MarkerFaceColor',[1,1,1],'MarkerSize',5);
plot(X, Y,'k');
ylim([-0.35 0.82])
h = ylabel('$\ln\alpha$');
set(h,'Interpreter','latex','FontSize',15);
g = xlabel('$\hat{D}_{0,\mathrm{naive}}$');
set(g,'Interpreter','latex','FontSize',15);
i = legend('$\alpha_\mathrm{opt}$', '$\alpha_\mathrm{model}$');
set(i,'Interpreter','latex','FontSize',15);
hold off