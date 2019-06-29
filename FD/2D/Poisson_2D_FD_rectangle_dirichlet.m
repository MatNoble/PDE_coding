% Modular
% Vectorization
% Matrix
function [ N_u ] = Poisson_2D_FD_rectangle_dirichlet( bx, by, N_x, N_y, Au, f, Mesh )

        % inner mesh
        h_x = (bx(2) - bx(1))/N_x;
        h_y = (by(2) - by(1))/N_y;
        s = h_x * h_y;
        [ x, y, X, Y, XX, YY ] = mesh( bx, by, h_x, h_y );
        % figure mesh
        z_mesh( bx, by, N_x, N_y, X, Y, XX, YY, Mesh )
              
        % number of unkonw nodes
        n_x = N_x-1;
        n_y = N_y-1;
        if Mesh == 1
            N_m = (n_x)*(n_y);
        elseif Mesh == 2
            N_m = (n_x)*(n_y) - N_x*N_y/4;
            index_x = N_x/2-1;
            index_y = N_y/2-1;
        end
        
        % generate_P_matrix
        P = generate_P_matrix( N_m, x, y, n_x, n_y, index_x, index_y, Mesh );

        % A
        A = assembly_A_matrix( N_x, N_y, h_x, h_y, index_x, index_y, Mesh );
        
        % b;
        b = zeros(N_m, 1);
        for i = 1:N_m
            b(i) = feval(f, P(1, i), P(2, i));
        end

        % treat dirichlet boundary conditions
        [ b ] = treat_dirichlet_boundary_conditions( Au, P, b, bx, by, h_x, h_y, Mesh );

          N_u = 0;
%         figure(2)
%         subplot(2,2,1)
%         surfc(X, Y, Au(X,Y))
%         % linear equations
%         N_u = A \ b;
%         A_u = Au(P(1,:), P(2,:))';
%         subplot(2,2,[3,4])
%         plot(1:N_m,N_u,'bo',1:N_m,A_u,'r.')
%         Error_Max = norm((N_u-A_u), inf);
%         fprintf('Max_norm: %g\n',Error_Max)
%         Ones = ones(1, N_m);
%         Error_L2 = sqrt(Ones * (s*(N_u-A_u).^2));
%         fprintf('L2_norm: %g',Error_L2)
%         
%         U = zeros(size(X));
%         k = 1;
%         for j = 1:N_x-1
%             for i = 1:N_y-1
%                 U(i,j) = N_u(k);
%                 k = k+1;
%             end
%         end
%         subplot(2,2,2)
%         surfc(X, Y, U)
        
end