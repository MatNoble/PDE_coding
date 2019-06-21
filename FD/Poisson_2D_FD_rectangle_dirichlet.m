function [ S_u ] = Poisson_2D_FD_rectangle_dirichlet( bx, by, N_x, N_y, Au, f )

        h_x = (bx(2) - bx(1))/N_x;
        h_y = (by(2) - by(1))/N_y;
        [ x, y, X, Y ] = mesh( bx, by, h_x, h_y );
        subplot(2,2,1)
        surf(X, Y, Au(X,Y))
        
        N_m = (N_x-1)*(N_y-1);
        P = zeros(2,N_m);
        k = 1;
        for i = 1:N_x-1
            xx = x(i);
            for j = 1:N_y-1
                P(1,k) = xx;
                yy = y(j);
                P(2,k) = yy;
                k = k+1;
            end
        end
        A1 = Matrix_1_2_1( N_x - 1 )/(h_x^2);
        A2 = Matrix_1_2_1( N_y - 1 )/(h_y^2);
        A = kron(A1,eye(N_y - 1)) + kron(eye(N_x - 1),A2);
        b = zeros(N_m, 1);
        for i = 1:N_m
            b(i) = feval(f, P(1,i), P(2,i));
        end
        
        % ´ý¸Ä½ø
        index1 = find(P(2,:) == by(1) + h_y);
        index2 = find(P(1,:) == bx(2) - h_x);
        index3 = find(P(2,:) == by(2) - h_y);
        index4 = find(P(1,:) == bx(1) + h_x);
        n1 = length(index1);
        for i = 1:n1
            xx = P(1,index1(i));
            yy = by(1);
            bb = feval(Au, xx, yy)/(h_y^2);
            b(index1(i)) = b(index1(i)) + bb;
        end
        n2 = length(index2);
        for i = 1:n2
            xx = bx(2);
            yy = P(2,index2(i));
            bb = feval(Au, xx, yy)/(h_x^2);
            b(index2(i)) = b(index2(i)) + bb;
        end
        n3 = length(index3);
        for i = 1:n3
            xx = P(1,index3(i));
            yy = by(2);
            bb = feval(Au, xx, yy)/(h_y^2);
            b(index3(i)) = b(index3(i)) + bb;
        end
        n4 = length(index4);
        for i = 1:n4
            xx = bx(1);
            yy = P(2,index4(i));
            bb = feval(Au, xx, yy)/(h_x^2);
            b(index4(i)) = b(index4(i)) + bb;
        end
        
        
        S_u = A \ b;
        A_u = Au(P(1,:), P(2,:));
        subplot(2,2,[3,4])
        plot(1:N_m,S_u,'bo',1:N_m,A_u,'r.')
        
        U = zeros(size(X));
        k = 1;
        for j = 1:N_x-1
            for i = 1:N_y-1
                U(i,j) = S_u(k);
                k = k+1;
            end
        end
        
        subplot(2,2,2)
        surf(X, Y, U)
end

