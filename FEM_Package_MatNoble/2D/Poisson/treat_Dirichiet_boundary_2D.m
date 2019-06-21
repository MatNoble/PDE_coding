function [A, b] = treat_Dirichiet_boundary_2D(function_u, A, b, boundary_nodes, Pb_trial)

        % N_bn : number of boundary nodes
        bn = find(boundary_nodes(1,:)==1);
        N_bn = length(bn);
        for j = 1:N_bn
            k = bn(j);
            i = boundary_nodes(2, k);
            A(i, :) = 0;
            A(i, i) = 1;
            b(i) = feval(function_u, Pb_trial(1,i), Pb_trial(2,i));
        end

end