function [ b ] = treat_dirichlet_boundary_conditions( Au, P, b, bx, by, h_x, h_y, Mesh )

        if Mesh == 1
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
        elseif Mesh == 2
        end

end

