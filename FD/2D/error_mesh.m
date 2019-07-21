function [] = error_mesh( Au, N_m, N_u, A_u, N_x, N_y, XX, YY, index_y, junction, Mesh)
    
        figure(Mesh+3)
        if Mesh == 1
            subplot(2,2,1)
            surf(XX, YY, Au(XX,YY))
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)

            subplot(2,2,2)
            U = Au(XX,YY);
            U(2:N_y,2:N_x) = reshape(N_u, N_y-1, N_x-1);
            surf(XX, YY, U)
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
        elseif Mesh == 2
            % L mesh
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
        elseif Mesh == 3
            XX1 = XX(:,1:N_x/4+1);
            YY1 = YY(:,1:N_x/4+1);
            XX2 = XX(1:N_x/4+1,N_x/4+1:end-N_x/4);
            YY2 = YY(1:N_x/4+1,N_x/4+1:end-N_x/4);
            XX3 = XX(end-N_x/4:end,N_x/4+1:end-N_x/4);
            YY3 = YY(end-N_x/4:end,N_x/4+1:end-N_x/4);
            XX4 = XX(:,end-N_x/4:end);
            YY4 = YY(:,end-N_x/4);
            subplot(2,2,1)
            surf(XX1, YY1, Au(XX1,YY1)), hold on
            surf(XX2, YY2, Au(XX2,YY2)), hold on
            surf(XX3, YY3, Au(XX3,YY3)), hold on
            surf(XX4, YY4, Au(XX4,YY4)), hold off
            xlabel('$$ x $$','Interpreter','latex','fontsize',15)
            ylabel('$$ y $$','Interpreter','latex','fontsize',15)
            zlabel('$$ u $$','Interpreter','latex','fontsize',15)
            
            subplot(2,2,2)
            n1 = index_y * (N_y-1);
            U1 = Au(XX1,YY1);
            U1(2:end-1,2:end-1) = reshape(N_u(1:n1), N_y-1, N_x/4-1);
            U1(2:index_y+1,end) = N_u(junction(1:index_y));
            U1(end-index_y:end-1,end) = N_u(junction(index_y+1:2*index_y));
            surf(XX1, YY1, U1), hold on
            
            nn = N_x/2 + 1;
            n2 = index_y * nn;
            U2 = Au(XX2,YY2);
            U2(2:end-1,:) = reshape(N_u(n1+1:n1+n2), index_y, nn);
            surf(XX2, YY2, U2), hold on
            
            n3 = index_y * nn;
            U3 = Au(XX3,YY3);
            U3(2:end-1,:) = reshape(N_u(n1+n2+1:n1+n2+n3), index_y, nn);
            surf(XX3, YY3, U3), hold on
            
            n4 = n1;
            U4 = Au(XX4,YY4);
            U4(2:end-1,2:end-1) = reshape(N_u(n1+n2+n3+1:n1+n2+n3+n4), N_y-1, N_x/4-1);
            U4(2:index_y+1,1) = N_u(junction(2*index_y + 1:3*index_y));
            U4(end-index_y:end-1,1) = N_u(junction(3*index_y+1:4*index_y));
            surf(XX4, YY4, U4), hold off
            
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