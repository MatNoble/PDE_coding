function [ ] = z_mesh( bx, by, N_x, N_y, X, Y, XX, YY, Mesh )

        figure(Mesh)
        if Mesh == 3
            
            XX1 = XX(:,1:N_x/4+1);
            YY1 = YY(:,1:N_x/4+1);
            plot(XX1,YY1,'k-'),hold on
            plot(XX1',YY1','k-'),hold on
            plot(XX1(2:N_y/4,end-1:end)',YY1(2:N_y/4,end-1:end)','r-','linewidth',1.2),hold on
            plot(XX1(end-N_y/4+1:end-1,end-1:end)',YY1(end-N_y/4+1:end-1,end-1:end)','r-','linewidth',1.2),hold on
            plot(XX1(2:end-1,2:end-1),YY1(2:end-1,2:end-1),'rx-','linewidth',1.2,'MarkerSize',8),hold on
            plot(XX1(2:end-1,2:end-1)',YY1(2:end-1,2:end-1)','rx-','linewidth',1.2,'MarkerSize',8),hold on
            
            XX2 = XX(1:N_y/4+1,N_x/4+1:end-N_x/4);
            YY2 = YY(1:N_y/4+1,N_x/4+1:end-N_x/4);
            plot(XX2,YY2,'k-'),hold on
            plot(XX2',YY2','k-'),hold on
            plot(XX2(2:end-1,:),YY2(2:end-1,:),'rx-','linewidth',1.2,'MarkerSize',8),hold on
            plot(XX2(2:end-1,:)',YY2(2:end-1,:)','rx-','linewidth',1.2,'MarkerSize',8),hold on
            
            XX3 = XX(end-N_y/4:end,N_x/4+1:end-N_x/4);
            YY3 = YY(end-N_y/4:end,N_x/4+1:end-N_x/4);
            plot(XX3,YY3,'k-'),hold on
            plot(XX3',YY3','k-'),hold on
            plot(XX3(2:end-1,:),YY3(2:end-1,:),'rx-','linewidth',1.2,'MarkerSize',8),hold on
            plot(XX3(2:end-1,:)',YY3(2:end-1,:)','rx-','linewidth',1.2,'MarkerSize',8),hold on
            
            XX4 = XX(:,end-N_x/4:end);
            YY4 = YY(:,end-N_x/4:end);
            plot(XX4,YY4,'k-'),hold on
            plot(XX4',YY4','k-'),hold on
            plot(XX4(2:N_y/4,1:2)',YY4(2:N_y/4,1:2)','r-','linewidth',1.2),hold on
            plot(XX4(end-N_y/4+1:end-1,1:2)',YY4(end-N_y/4+1:end-1,1:2)','r-','linewidth',1.2),hold on
            plot(XX4(2:end-1,2:end-1),YY4(2:end-1,2:end-1),'rx-','linewidth',1.2,'MarkerSize',8),hold on
            plot(XX4(2:end-1,2:end-1)',YY4(2:end-1,2:end-1)','rx-','linewidth',1.2,'MarkerSize',8),hold off
            title('Mesh')
        elseif Mesh == 2
            % Mesh node
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
            
            % finite diffierence node
            
            X1(1:N_y/2,:) = X(1:N_y/2,:);
            X1(N_y/2+1:N_y,:) = X(N_y/2:N_y-1,:);
            X1(:,N_x/2+1:N_x) = X1(:,N_x/2:N_x-1);

            Y1(1:N_y/2,:) = Y(1:N_y/2,:);
            Y1(N_y/2+1:N_y,:) = Y(N_y/2:N_y-1,:);
            Y1(:,N_x/2+1:N_x) = Y1(:,N_x/2:N_x-1);

            plot(X1(1:N_y/2-1,:),Y1(1:N_y/2-1,:),'rx-','linewidth',1.5,'MarkerSize',10),hold on
            plot(X1(1:N_y/2-1,:)',Y1(1:N_y/2-1,:)','rx-','linewidth',1.5,'MarkerSize',10),hold on
            plot(X1(N_y/2-1:N_y,1:N_x/2-1),Y1(N_y/2-1:N_y,1:N_x/2-1),'rx-','linewidth',1.5,'MarkerSize',10),hold on
            plot(X1(N_y/2-1:N_y,1:N_x/2-1)',Y1(N_y/2-1:N_y,1:N_x/2-1)','rx-','linewidth',1.5,'MarkerSize',10),hold off
            title('L Mesh')
        elseif Mesh == 1
            plot(XX,YY,'k-'),hold on
            plot(XX',YY','k-'),hold on
            plot(X,Y,'rx-','linewidth',1.5,'MarkerSize',10),hold on
            plot(X',Y','rx-','linewidth',1.5,'MarkerSize',10),hold off
            title('Mesh')
        end
        set(gca,'FontSize',20);
        axis equal
        set(gca,'xtick',[],'ytick',[])
        xlim(bx)
        ylim(by)

end

