function [] = Plot(X, F, U)

    figure
    E = plot(X, F(X), 'g--', 'LineWidth', 1.5); hold on
    Ap = plot(X, U(X), 'b-', 'LineWidth', 1.5); hold off
    h = legend([E, Ap], 'Exact', 'Approximation', 'Location', 'bestoutside');
    set(h, 'Fontsize', 10)
    grid on
    set(gca,'looseInset',[0 0.01 0 0.01])
    
end

