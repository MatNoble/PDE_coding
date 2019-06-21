function A = Matrix_1_2_1( n )

        A = eye(n);
        for i = 1:n-1
            A(i, i+1) = -1;
        end
        A = A + A';

end

