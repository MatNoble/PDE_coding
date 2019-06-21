function boundary_nodes = generate_boundary_nodes_1D(T, Tb_trial, Boundary_type)

        boundary_nodes = zeros(3,2);
        boundary_nodes(1,1) = Boundary_type(1);
        boundary_nodes(1,2) = Boundary_type(2);
        boundary_nodes(2,1) = Tb_trial(1,1);
        boundary_nodes(2,2) = Tb_trial(2,end);
        boundary_nodes(3,1) = T(1,1);
        boundary_nodes(3,2) = T(2,end);

end

