function  b = treat_Neumann_boundary_2D(u_xy, c, P, b, boundary_nodes, boundary_edges)

        
        % N_bn : number of boundary nodes
        if Boundary_type(1) == 2
            a = P(boundary_nodes(3, 1));
            b(1) = b(1) - feval(function_u_x, a)*feval(function_c, a);
        end
        if Boundary_type(2) == 2
            bb = P(boundary_nodes(3, 2));
            b(end) = b(end) + feval(function_u_x, bb)*feval(function_c, bb);
        end
        
end