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
        end
        index_x = N_x/2-1;
        index_y = N_y/2-1;
        
        % generate_P_matrix
        P = generate_P_matrix( N_m, x, y, n_x, n_y, index_x, index_y, Mesh );

        % A
        A = assembly_A_matrix( N_x, N_y, h_x, h_y, index_x, index_y, Mesh );
        
        % b
        b = assembly_b_vector( N_m, f, P );

        % treat dirichlet boundary conditions
        b = treat_dirichlet_boundary_conditions( Au, P, b, bx, by, h_x, h_y, Mesh );

        % linear equations
        N_u = A \ b;
        A_u = Au(P(1,:), P(2,:))';
        
        % error 
        Error_Max = norm((N_u-A_u), inf);
        fprintf('Max_norm: %g\n',Error_Max)
        Ones = ones(1, N_m);
        Error_L2 = sqrt(Ones * (s*(N_u-A_u).^2));
        fprintf('L2_norm: %g',Error_L2)
        
        % error mesh
        error_mesh( Au, N_m, N_u, A_u, N_x, N_y, XX, YY, index_y, Mesh)
              
end