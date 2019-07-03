% One-dimensional Poisson equation
function [N_s] = Poisson_2D(left, right, top, bottom, u, u_xy, c, f, nx, ny, p, basis_type, Boundary_type)

% x1, x2  left and right endpoints
% number of mesh elements
% p : Degree of distortion
% basis_type : 
              % 201 : 2D linear
              % 202 : 2D quadratic
% Gauss_type : 2, 4, 8

    % mesh
    px = p;
    py = p;
    [ X, Y ] = RandAxis(left, right, top, bottom, nx, ny, px, py);
  
    % N : number of mesh elements
    N_m = 2*nx*ny;
    % N_m : number of mesh nodes
    N_mn = (nx+1)*(ny+1);
    
    % generate matrix P, T, Pb, Tb
    % P & T : mesh nodes (coordinate & global index)
    % Pb & Tb : FE basis(nodes) (coordinate & global index)
    if basis_type == 202
        nxx = 2*nx;
        nyy = 2*ny;
        [ X1, Y1 ] = RandAxis(left, right, top, bottom, nxx, nyy, px, py);
    else
        X1 = X;
        Y1 = Y;
    end
    [P, T, Pb, Tb] = generate_PT_2D(nx, ny, N_m, N_mn, X, Y, X1, Y1, basis_type);
    Pb_trial = Pb;
    % Pb_test = P;
    Tb_trial = Tb;
    Tb_test = Tb; 
    
    % drawing mesh
    triangle_mesh( nx, ny, P, T, X, Y )
       
    % N_b : number of the FE basis(nodes)
    if basis_type == 201 % linear
        N_b = (nx+1)*(ny+1);
    elseif basis_type == 202 % quadratic
        N_b = (2*nx + 1)*(2*ny + 1);
    end
    % stiffness matrix size
    matrix_size = [N_b, N_b];

    % basis_type
    basis_type_trial = basis_type;
    basis_type_test = basis_type;

    % number of basis
    if basis_type_trial == 201
        number_of_local_basis_functions_trial = 3;
    elseif basis_type_trial == 202
        number_of_local_basis_functions_trial = 6;
    end
    if basis_type_test == 201
        number_of_local_basis_functions_test = 3;
    elseif basis_type_test == 202
        number_of_local_basis_functions_test = 6;
    end
    
    [Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle] = generate_Gauss_reference_triangle(9);
    
    number_of_elements = N_m;
    % assemble A
    A1 = assemble_matrix_2D(c, matrix_size, P, T, Tb_trial, Tb_test, number_of_elements,...
                           number_of_local_basis_functions_trial, number_of_local_basis_functions_test,...
                           Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle,...
                           basis_type_trial, 1, 0, basis_type_test, 1, 0);
    A2 = assemble_matrix_2D(c, matrix_size, P, T, Tb_trial, Tb_test, number_of_elements,...
                           number_of_local_basis_functions_trial, number_of_local_basis_functions_test,...
                           Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle,...
                           basis_type_trial, 0, 1, basis_type_test, 0, 1);
    A = A1 + A2;

    % assemble b
    b = assemble_vector_2D(f, P, T, Tb_test, number_of_local_basis_functions_test,...
                           Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle,...
                           number_of_elements, N_b, basis_type_test, 0, 0);
    
    % generate matrix boundary_nodes, boundary_edges
    [boundary_nodes, boundary_edges] = generate_boundary_nodes_2D(nx, ny, basis_type, Boundary_type, T);
    
    % treat_Neumann_boundary
%     b = treat_Neumann_boundary_2D(u_xy, c, P, b, boundary_nodes, boundary_edges);
    
    % treat_Dirichiet_boundary
    [A, b] = treat_Dirichiet_boundary_2D(u, A, b, boundary_nodes, Pb_trial);

    % Numerical solution
    N_s = A\b;
    % Analytical solution
    A_s = u(Pb(1,:), Pb(2,:))';
    % error_max
    error_max = norm((N_s - A_s), inf);
    fprintf('Error_Max_norm: %g\n',error_max)
    Ones = ones(1, N_b);
    s = 1/N_m;
    Error_L2 = sqrt(Ones * (s*(N_s - A_s).^2));
    fprintf('Error_L2_norm: %g',Error_L2)

    error_mesh(nx, ny, N_b, X, Y, X1, Y1, N_s, A_s, basis_type)
    
end
