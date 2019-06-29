function [ b ] = treat_dirichlet_boundary_conditions( Au, P, b, bx, by, h_x, h_y, Mesh )

        index1 = find(abs(P(2,:) - (by(1) + h_y)) < eps);
        bb1 = feval(Au, P(1,index1), by(1))/(h_y^2);
        b(index1) = b(index1) + bb1';

        index2 = find(abs(P(1,:) - (bx(2) - h_x)) < eps);
        bb2 = feval(Au, bx(2), P(2,index2))/(h_x^2);
        b(index2) = b(index2) + bb2';

        index3 = find(abs(P(2,:) - (by(2) - h_y)) < eps);
        bb3 = feval(Au, P(1,index3), by(2))/(h_y^2);
        b(index3) = b(index3) + bb3';

        index4 = find(abs(P(1,:) - (bx(1) + h_x)) < eps);
        bb4 = feval(Au, bx(1), P(2,index4))/(h_x^2);
        b(index4) = b(index4) + bb4';
        if Mesh == 2
         
            index20 = find(abs(P(1,:) - (mean(bx) - h_x)) < eps);
            index21 = [find( abs(P(2,:) - mean(by)) < eps )  find( P(2,:) - mean(by) > eps ) ];
            index20 = intersect(index20, index21);
            bb2 = feval(Au, mean(bx), P(2,index20))/(h_x^2);
            b(index20) = b(index20) + bb2';
            
            index30 = find(abs(P(2,:) - (mean(by) - h_y)) < eps);
            index31 = [find( abs(P(1,:) - mean(bx)) < eps )  find( P(1,:) - mean(bx) > eps ) ];
            index30 = intersect(index30, index31);
            bb3 = feval(Au, P(1,index30), mean(by))/(h_y^2);
            b(index30) = b(index30) + bb3';

        end

end

