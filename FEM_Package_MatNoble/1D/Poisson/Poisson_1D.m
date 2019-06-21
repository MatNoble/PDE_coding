% One-dimensional Poisson equation
function [N_s, error_max] = Poisson_1D(u, u_x, c, f, x1, xn, number_of_elements, p, basis_type, Gauss_type, Boundary_type)

% x1, x2 £º left and right endpoints
% number of mesh elements
% p : Degree of distortion
% basis_type : 
              % 101 : 1D linear
              % 102 : 1D quadratic
% Gauss_type : 2, 4, 8

    % N : number of mesh elements
    N = number_of_elements;
    % N_m : number of mesh nodes
    N_m = N + 1;
    % N_b : number of the FE basis(nodes)
    if basis_type == 101 % linear
        N_b = N + 1;
    elseif basis_type == 102 % quadratic
        N_b = 2*N + 1;
    end
    % stiffness matrix size
    matrix_size = [N_b, N_b];
    
    % randomly generate step size h
    x = zeros(1, N_m-2);
    hh = (xn-x1)/N;
    for i = 1:N_m-2
        x(i) = x1 + i*hh + (2*rand(1)-1)*p*hh;
    end
    x = [x1,x,xn];
    h = diff(x);
    
    % generate matrix P, T, Pb, Tb
    % P & T : mesh nodes (coordinate & global index)
    % Pb & Tb : FE basis(nodes) (coordinate & global index)
    [P, T, Pb, Tb] = generate_PT(x1, xn, h, N_m, basis_type);
    Pb_trial = Pb;
    % Pb_test = P;
    Tb_trial = Tb;
    Tb_test = Tb;    

    % basis_type
    basis_type_trial = basis_type;
    basis_type_test = basis_type;

    % number of basis
    if basis_type_trial == 101
        number_of_local_basis_functions_trial = 2;
    elseif basis_type_trial == 102
        number_of_local_basis_functions_trial = 3;
    end
    if basis_type_test == 101
        number_of_local_basis_functions_test = 2;
    elseif basis_type_test == 102
        number_of_local_basis_functions_test = 3;
    end
    
    % assemble A
    A = assemble_matrix_1D(c, Gauss_type, matrix_size, P, T, Tb_trial, Tb_test, number_of_elements,...
                           number_of_local_basis_functions_trial, number_of_local_basis_functions_test,...
                           basis_type_trial, 1, basis_type_test, 1);

    % assemble b
    b = assemble_vector_1D(f, Gauss_type, P, T, Tb_test, number_of_local_basis_functions_test,...
                           number_of_elements, N_b, basis_type_test, 0);

    
    boundary_nodes = generate_boundary_nodes_1D(T, Tb_trial, Boundary_type);
    
    % treat_Neumann_boundary
    b = treat_Neumann_boundary(u_x, c, P, b, boundary_nodes, Boundary_type);
    
    % treat_Dirichiet_boundary
    [A, b] = treat_Dirichiet_boundary(u, A, b, boundary_nodes, Pb_trial);

    % Numerical solution
    N_s = A\b;
    % Analytical solution
    A_s = u(Pb(1,:))';
    % error_max
    error_max = max(abs(N_s - A_s));

    % plot
    plot(Pb(1,:), 0, 'k*', Pb(1,:), N_s, 'ro', Pb(1,:), A_s, 'b.')
    
end
