function A = Matrix( k, n )

        A = ((6*k^2-5*k)/4) * eye(n);
        for i = 1:n-1
            A(i, i+1) = (2*k*(2-3*k))/3;
            if i < n-1
                A(i, i+2) = -(k*(1-6*k))/12;
            end
        end
        A = A + A';
        A(2, :) = 0;
        A(n-1, :) = 0;
        A(2, 2) = -2*k;
        A(2, [1 , 3]) = k;
        A(n-1, [n-2, n]) = k;
        A(n-1, n-1) = -2*k;
        A(1, :) = 0;
        A(end, :) = 0;

end

