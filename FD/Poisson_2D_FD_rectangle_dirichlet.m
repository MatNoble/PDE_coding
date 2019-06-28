% Modular
% Vectorization
% Matrix
function [ N_u ] = Poisson_2D_FD_rectangle_dirichlet( bx, by, N_x, N_y, Au, f, Mesh )

        % inner mesh
        h_x = (bx(2) - bx(1))/N_x;
        h_y = (by(2) - by(1))/N_y;
        s = h_x * h_y;
        [ x, y, X, Y, XX, YY ] = mesh( bx, by, h_x, h_y );
        
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
%         axis off
        xlim(bx)
        ylim(by)

        figure(2)
        subplot(2,2,1)
        surf(X, Y, Au(X,Y))
        
        % number of unkonw nodes
        n_x = N_x-1;
        n_y = N_y-1;
        N_m = (n_x)*(n_y);
        
        % coordinate matrix
        P = zeros(2,N_m);
        C = ones(1, n_y);
        P(1, :) = kron(x, C);
        B = ones(1, n_x);
        P(2, :) = kron(B, y);
        
        % A
        A1 = Matrix_1_2_1( N_x - 1 )/(h_x^2);
        A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
        A = kron(A1,eye(N_y - 1)) + kron(eye(N_x - 1),A2);
        
        % b;
        b = zeros(N_m, 1);
        for i = 1:N_m
            b(i) = feval(f, P(1, i), P(2, i));
        end

        % treat diric        hlet boundary conditions
        index1 = find(P(2,:) == by(1) + h_y);
        bb1 = feval(Au, P(1,index1), by(1))/(h_y^2);
        b(index1) = b(index1) + bb1';
        
        index2 = find(P(1,:) == bx(2) - h_x);
        bb2 = feval(Au, bx(2), P(2,index2))/(h_x^2);
        b(index2) = b(index2) + bb2';
        
        index3 = find(P(2,:) == by(2) - h_y);
        bb3 = feval(Au, P(1,index3), by(2))/(h_y^2);
        b(index3) = b(index3) + bb3';
        
        index4 = find(P(1,:) == bx(1) + h_x);
        bb4 = feval(Au, bx(1), P(2,index4))/(h_x^2);
        b(index4) = b(index4) + bb4';

        % linear equations
        N_u = A \ b;
        A_u = Au(P(1,:), P(2,:))';
        subplot(2,2,[3,4])
        plot(1:N_m,N_u,'bo',1:N_m,A_u,'r.')
        Error_Max = norm((N_u-A_u), inf);
        fprintf('无穷范数: %g\n',Error_Max)
        Ones = ones(1, N_m);
        Error_L2 = sqrt(Ones * (s*(N_u-A_u).^2));
        fprintf('L2 范数: %g',Error_L2)
        
        U = zeros(size(X));
        k = 1;
        for j = 1:N_x-1
            for i = 1:N_y-1
                U(i,j) = N_u(k);
                k = k+1;
            end
        end
        subplot(2,2,2)
        surf(X, Y, U)
end

