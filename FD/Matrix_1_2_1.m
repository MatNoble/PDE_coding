function A = Matrix_1_2_1( n )

        A = sparse(n, n);
        for i = 1:n
            A(sub2ind(size(A), i, i)) = 2;
            if i<n
                A(sub2ind(size(A), i, i+1)) = -1;
                A(sub2ind(size(A), i+1, i)) = -1;
            end
        end

end

