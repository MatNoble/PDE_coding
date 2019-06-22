% Modular
% Vectorization
% Matrix
function [ N_u ] = Poisson_2D_FD_rectangle_dirichlet( bx, by, N_x, N_y, Au, f )

        % inner mesh
        h_x = (bx(2) - bx(1))/N_x;
        h_y = (by(2) - by(1))/N_y;
        [ x, y, X, Y ] = mesh( bx, by, h_x, h_y );
        subplot(2,2,1)
        surf(X, Y, Au(X,Y))
        
        % number of unkonw nodes
        n_x = N_x-1;
        n_y = N_y-1;
        N_m = (n_x)*(n_y);
        
        % coordinate matrix
        P = zeros(2,N_m);
        C = ones(1, n_y);
        P(1, :) = kron(x, C);
        B = ones(1, n_x);
        P(2, :) = kron(B, y);
        
        % A
        A1 = Matrix_1_2_1( N_x - 1 )/(h_x^2);
        A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
        A = kron(A1,eye(N_y - 1)) + kron(eye(N_x - 1),A2);
        
        % b
        b = feval(f, P(1, :), P(2, :))';

        % treat diric        hlet boundary conditions
        index1 = find(P(2,:) == by(1) + h_y);
        bb1 = feval(Au, P(1,index1), by(1))/(h_y^2);
        b(index1) = b(index1) + bb1';
        
        index2 = find(P(1,:) == bx(2) - h_x);
        bb2 = feval(Au, bx(2), P(2,index2))/(h_x^2);
        b(index2) = b(index2) + bb2';
        
        index3 = find(P(2,:) == by(2) - h_y);
        bb3 = feval(Au, P(1,index3), by(2))/(h_y^2);
        b(index3) = b(index3) + bb3';
        
        index4 = find(P(1,:) == bx(1) + h_x);
        bb4 = feval(Au, bx(1), P(2,index4))/(h_x^2);
        b(index4) = b(index4) + bb4';

        % linear equations
        N_u = A \ b;
        A_u = Au(P(1,:), P(2,:));
        subplot(2,2,[3,4])
        plot(1:N_m,N_u,'bo',1:N_m,A_u,'r.')
        
        U = zeros(size(X));
        k = 1;
        for j = 1:N_x-1
            for i = 1:N_y-1
                U(i,j) = N_u(k);
                k = k+1;
            end
        end
        subplot(2,2,2)
        surf(X, Y, U)
end
