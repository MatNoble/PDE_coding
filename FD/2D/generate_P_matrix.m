function [ P ] = generate_P_matrix( N_m, x, y, n_x, n_y, index_x, index_y,  Mesh )

        P = zeros(2,N_m);
        if Mesh == 1
            C = ones(1, n_y);
            P(1, :) = kron(x, C);
            B = ones(1, n_x);
            P(2, :) = kron(B, y);
        elseif Mesh == 2
            % 1
            C = ones(1, n_y);
            temp_index2 = index_x*n_y;
            P(1, 1:temp_index2) = kron(x(1:index_x), C);
            B = ones(1, index_x);
            P(2, 1:temp_index2) = kron(B, y);
            % 2
            temp_index1 = temp_index2;
            C = ones(1, index_y);
            P(1, temp_index1+1:end) = kron(x(index_x+1:end), C);
            B = ones(1, index_x+1);
            P(2, temp_index1+1:end) = kron(B, y(1:index_y));
        elseif Mesh == 3
            nn = (n_x + 1)/2 + 1;
            index_x = (n_x - nn)/2;
            index_y = index_x;
            n_local = index_y*nn;
            % 1
            temp_index2 = index_x*n_y;
            C = ones(1, n_y);
            P(1, 1:temp_index2) = kron(x(1:index_x), C);
            B = ones(1, index_x);
            P(2, 1:temp_index2) = kron(B, y);
            P(3, 1:temp_index2) = 1;
            % 2
            temp_index1 = temp_index2;
            temp_index2 = temp_index2+n_local;
            C = ones(1, index_y);
            P(1, temp_index1+1:temp_index2) = kron(x(index_x+1:end-index_x), C);
            B = ones(1, nn);
            P(2, temp_index1+1:temp_index2) = kron(B, y(1:index_y));
            P(3, temp_index1+1:temp_index2) = 2;
            % 3
            temp_index1 = temp_index2;
            temp_index2 = temp_index2+n_local;
            P(1, temp_index1+1:temp_index2) = kron(x(index_x+1:end-index_x), C);
            B = ones(1, nn);
            P(2, temp_index1+1:temp_index2) = kron(B, y(end-index_y+1:end));
            P(3, temp_index1+1:temp_index2) = 3;
            % 4
            temp_index1 = temp_index2;
            C = ones(1, n_y);
            P(1, temp_index1+1:end) = kron(x(end-index_x+1:end), C);
            B = ones(1, index_x);
            P(2, temp_index1+1:end) = kron(B, y);
            P(3, temp_index1+1:end) = 4;
        end
        
end

