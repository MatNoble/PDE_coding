function [] = error_mesh( Au, N_m, N_u, A_u, N_x, N_y, XX, YY, index_y, Mesh)
    
        figure(Mesh+2)
        if Mesh == 1
            subplot(2,2,1)
            surfc(XX, YY, Au(XX,YY))
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)

            subplot(2,2,2)
            U = Au(XX,YY);
            k = 1;
            for j = 2:N_x
                for i = 2:N_y
                    U(i,j) = N_u(k);
                    k = k+1;
                end
            end
            surfc(XX, YY, U)
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
        elseif Mesh == 2
            XX1 = XX(:,1:N_x/2+1);
            YY1 = YY(:,1:N_x/2+1);
            XX2 = XX(1:N_y/2+1,N_x/2+1:end);
            YY2 = YY(1:N_y/2+1,N_x/2+1:end);
            subplot(2,2,1)
            surfc(XX1, YY1, Au(XX1,YY1)), hold on
            surfc(XX2, YY2, Au(XX2,YY2)), hold off
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
            
            subplot(2,2,2)
            U1 = Au(XX1,YY1);
            k = 1;
            for j = 2:N_x/2
                for i = 2:N_y
                    U1(i,j) = N_u(k);
                    k = k+1;
                end
            end
            U1(2:N_y/2,end) = N_u(k:k+index_y-1);

            U2 = Au(XX2,YY2);
            for j = 1:N_x/2
                for i = 2:N_y/2
                    U2(i,j) = N_u(k);
                    k = k+1;
                end
            end
            surfc(XX1, YY1, U1), hold on
            surfc(XX2, YY2, U2), hold off
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
        end
        
        subplot(2,2,[3,4])
        plot(1:N_m,N_u,'bo',1:N_m,A_u,'r.')
        xlabel('index', 'fontsize',15)
        ylabel('$$ u $$','Interpreter','latex','fontsize',15)
        
end

