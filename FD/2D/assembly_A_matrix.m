function [ A ] = assembly_A_matrix( N_x, N_y, h_x, h_y, index_x, index_y, junction, Mesh )

         if Mesh == 1
            A1 = Matrix_1_2_1( N_x - 1 )/(h_x^2);
            A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
            A = kron(A1,eye(N_y - 1)) + kron(eye(N_x - 1),A2);
        elseif Mesh == 2
            A1 = Matrix_1_2_1( index_x )/(h_x^2);
            A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
            AA = kron(A1,eye(N_y - 1)) + kron(eye(index_x),A2);
            index = 1:size(AA,2);
            A(index, index) = AA;
            
            B1 = Matrix_1_2_1( index_x + 1 )/(h_x^2);
            B2 = Matrix_1_2_1( index_y )/(h_y^2);
            B = kron(B1,eye(index_y)) + kron(eye(index_x+1),B2);
            index = size(AA,2) + 1 : size(AA,2) + size(B,2);
            A(index, index) = B;
            
            Pb = zeros(2, index_y);
            Pb(1,:) = (index_x-1) * (N_y-1) + 1 : (index_x-1) * (N_y-1) + index_y;
            Pb(2,:) = (index_x) * (N_y-1) + 1 : (index_x) * (N_y-1) + index_y;
            
            n = size(Pb, 2);
            m = -1/(h_x^2);
            for i = 1:n
                A(Pb(1,i), Pb(2,i)) = m;
                A(Pb(2,i), Pb(1,i)) = m;
            end
        elseif Mesh == 3
            nn = N_x/2 + 1;
            
            A1 = Matrix_1_2_1( index_x )/(h_x^2);
            A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
            AA = kron(A1,eye(N_y - 1)) + kron(eye(index_x),A2);
            index = 1:size(AA,2);
            A(index, index) = AA;
            
            B1 = Matrix_1_2_1( nn )/(h_x^2);
            B2 = Matrix_1_2_1( index_y )/(h_y^2);
            B = kron(B1,eye(index_y)) + kron(eye(nn),B2);
            index = size(A,2) + 1 : size(A,2) + size(B,2);
            A(index, index) = B;
            
            C1 = Matrix_1_2_1( nn )/(h_x^2);
            C2 = Matrix_1_2_1( index_y )/(h_y^2);
            C = kron(C1,eye(index_y)) + kron(eye(nn),C2);
            index = size(A,2) + 1 : size(A,2) + size(C,2);
            A(index, index) = C;
            
            D1 = Matrix_1_2_1( index_x )/(h_x^2);
            D2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
            D = kron(D1,eye(N_y - 1)) + kron(eye(index_x),D2);
            index = size(A,2) + 1 : size(A,2) + size(D,2);
            A(index, index) = D;
            
            % Junction            
            Pb = junction(2:3, :);
            n = size(Pb, 2);
            m = -1/(h_x^2);
            for i = 1:n
                A(Pb(1,i), Pb(2,i)) = m;
                A(Pb(2,i), Pb(1,i)) = m;
            end
            
         end
end