function b = assemble_load_vector(f, V, x)
    
    x_0 = x(1);
    x_N = x(end);
    n = size(V, 2);
    b = zeros(n, 1);
    
    for i = 1:n
        s = V(i)*f;
        b(i) = int(s,'x', x_0, x_N);
    end
    
end

