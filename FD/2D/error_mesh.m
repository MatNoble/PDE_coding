function [] = error_mesh( Au, N_m, N_u, A_u, N_x, N_y, XX, YY, index_y, Mesh)
    
        figure(Mesh+2)
        if Mesh == 1
            subplot(2,2,1)
%             surf(XX, YY, Au(XX,YY))
%             xlabel('$$ x $$','Interpreter','latex','fontsize',15)
%             ylabel('$$ y $$','Interpreter','latex','fontsize',15)
%             zlabel('$$ u $$','Interpreter','latex','fontsize',15)

            subplot(2,2,2)
            U = Au(XX,YY);
            U(2:N_y,2:N_x) = reshape(N_u, N_y-1, N_x-1);
            surf(XX, YY, U)
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
        elseif Mesh == 2
            XX1 = XX(:,1:N_x/2+1);
            YY1 = YY(:,1:N_x/2+1);
            XX2 = XX(1:N_y/2+1,N_x/2+1:end);
            YY2 = YY(1:N_y/2+1,N_x/2+1:end);
            subplot(2,2,1)
            surf(XX1, YY1, Au(XX1,YY1)), hold on
            surf(XX2, YY2, Au(XX2,YY2)), hold off
            
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
            
            subplot(2,2,2)
            U1 = Au(XX1,YY1);
            U1(2:N_y,2:N_x/2) = reshape(N_u(1:(N_y-1)*(N_x/2-1)), N_y-1, N_x/2-1);
            k = (N_y-1)*(N_x/2-1) + 1;
            U1(2:N_y/2,end) = N_u(k:k+index_y-1);

            U2 = Au(XX2,YY2);
            U2(2:N_y/2,1:N_x/2) = reshape(N_u(k:end), N_y/2-1, N_x/2);
            surf(XX1, YY1, U1), hold on
            surf(XX2, YY2, U2), hold off
            view([119.5575 51.6442])
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
        end
        
        subplot(2,2,[3,4])
        plot(1:N_m,N_u,'bo','MarkerSize',3),hold on
        plot(1:N_m,A_u,'r.','MarkerSize',2),hold off
        xlabel('index', 'fontsize',15)
        ylabel('$$ u $$','Interpreter','latex','fontsize',15)
        
end