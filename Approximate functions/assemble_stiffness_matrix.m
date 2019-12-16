function A = assemble_stiffness_matrix(V, x)
    
    x_0 = x(1);
    x_N = x(end);
    n = size(V, 2);
    A = zeros(n, n);
    
    for i = 1:(n-1)
        for j = (i+1):n
            s = V(i)*V(j);
            A(i,j) = int(s,'x', x_0, x_N);
        end
    end
    A = A + A';
    
    for i = 1:n
        s = V(i)*V(i);
        A(i, i) = int(s,'x', x_0, x_N);
    end
end

