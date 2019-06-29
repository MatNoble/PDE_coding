function [ P ] = generate_P_matrix( N_m, x, y, n_x, n_y, index_x, index_y,  Mesh )

        P = zeros(2,N_m);
        if Mesh == 1
            C = ones(1, n_y);
            P(1, :) = kron(x, C);
            B = ones(1, n_x);
            P(2, :) = kron(B, y);
        elseif Mesh == 2

            C = ones(1, n_y);
            P(1, 1:index_x*n_y) = kron(x(1:index_x), C);
            C = ones(1, index_y);
            P(1, index_x*n_y+1:end) = kron(x(index_x+1:end), C);
            
            B = ones(1, index_x);
            P(2, 1:index_x*n_y) = kron(B, y);
            B = ones(1, index_x+1);
            P(2, index_x*n_y+1:end) = kron(B, y(1:index_y));
        end
        
end

