function [] = error_mesh(nx, ny, N_b, X, Y, X1, Y1, N_s, A_s, basis_type)

    % drawing
    figure(2)
    if basis_type == 202
        nx = 2*nx;
        ny = 2*ny;
        X = X1;
        Y = Y1;
    end
    NN_s = reshape(N_s, ny+1, nx+1);
    subplot(2,2,1)
    surfc(X, Y, NN_s)
    xlabel('x')
    ylabel('y')
    zlabel('$$ u_h $$','Interpreter','latex')
    title('Numerical solution')
    set(gca,'FontSize',15);
    
    AA_s = reshape(A_s, ny+1, nx+1);
    subplot(2,2,2)
    surfc(X, Y, AA_s)
    xlabel('x')
    ylabel('y')
    zlabel('$$ u $$','Interpreter','latex')
    title('Analytical solution')
    set(gca,'FontSize',15);
    
    subplot(2,2,[3, 4])
    plot(1:N_b, N_s,'bo','MarkerSize',5),hold on
    plot(1:N_b, A_s,'r.','MarkerSize',3),hold off
    xlabel('index')
    ylabel('$$ u $$','Interpreter','latex')
    set(gca,'FontSize',15);
    
end

