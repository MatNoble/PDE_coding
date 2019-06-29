function [ ] = z_mesh( bx, by, N_x, N_y, X, Y, XX, YY, Mesh )

        figure(1)
        if Mesh == 2
            N_X = N_x + 2;
            N_Y = N_y + 2;
            XX1(1:N_Y/2,:) = XX(1:N_Y/2,:);
            XX1(N_Y/2+1:N_Y,:) = XX(N_Y/2:N_Y-1,:);
            XX1(:,N_X/2+1:N_X) = XX1(:,N_X/2:N_X-1);

            YY1(1:N_Y/2,:) = YY(1:N_Y/2,:);
            YY1(N_Y/2+1:N_Y,:) = YY(N_Y/2:N_Y-1,:);
            YY1(:,N_X/2+1:N_X) = YY1(:,N_X/2:N_X-1);
            
            plot(XX1(1:N_Y/2,:),YY1(1:N_Y/2,:),'k-'),hold on
            plot(XX1(1:N_Y/2,:)',YY1(1:N_Y/2,:)','k-'),hold on
            plot(XX1(N_Y/2+1:N_Y,1:N_X/2),YY1(N_Y/2+1:N_Y,1:N_X/2),'k-'),hold on
            plot(XX1(N_Y/2+1:N_Y,1:N_X/2)',YY1(N_Y/2+1:N_Y,1:N_X/2)','k-'),hold on
            
            X1(1:N_y/2,:) = X(1:N_y/2,:);
            X1(N_y/2+1:N_y,:) = X(N_y/2:N_y-1,:);
            X1(:,N_x/2+1:N_x) = X1(:,N_x/2:N_x-1);

            Y1(1:N_y/2,:) = Y(1:N_y/2,:);
            Y1(N_y/2+1:N_y,:) = Y(N_y/2:N_y-1,:);
            Y1(:,N_x/2+1:N_x) = Y1(:,N_x/2:N_x-1);

            plot(X1(1:N_y/2-1,:),Y1(1:N_y/2-1,:),'ro-','linewidth',1.5,'MarkerSize',12),hold on
            plot(X1(1:N_y/2-1,:)',Y1(1:N_y/2-1,:)','ro-','linewidth',1.5,'MarkerSize',12),hold on
            plot(X1(N_y/2-1:N_y,1:N_x/2-1),Y1(N_y/2-1:N_y,1:N_x/2-1),'ro-','linewidth',1.5,'MarkerSize',12),hold on
            plot(X1(N_y/2-1:N_y,1:N_x/2-1)',Y1(N_y/2-1:N_y,1:N_x/2-1)','ro-','linewidth',1.5,'MarkerSize',12),hold off
            title('L Mesh')
        elseif Mesh == 1
            plot(XX,YY,'k-'),hold on
            plot(XX',YY','k-'),hold on
            plot(X,Y,'ro-','linewidth',1.5,'MarkerSize',12),hold on
            plot(X',Y','ro-','linewidth',1.5,'MarkerSize',12),hold off
            title('Mesh')
        end
        set(gca,'FontSize',20);
        axis equal
        set(gca,'xtick',[],'ytick',[])
        xlim(bx)
        ylim(by)

end

