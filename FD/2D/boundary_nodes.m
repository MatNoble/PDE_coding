function boundary = boundary_nodes( n_x, n_y, Mesh )
    
        n1 = 2 * n_x * n_y;
        boundary = zeros(2, n1);
        if Mesh == 1
            a = 1:n_x;
            boundary(1,a) = 1;
            b = 1 : n_y : (n_x-1)*n_y+1;
            boundary(2,a) = b;
            
            a = n_x+1 : n_x+n_y;
            boundary(1,a) = 2;
            b = 
        elseif Mesh == 2
            
        end

end

