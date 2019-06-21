function [boundary_nodes, boundary_edges] = generate_boundary_nodes_2D(nx, ny, basis_type, Boundary_type, T)

        boundary_edges = zeros(4, 2*(nx+ny));
        % boundary_edges(1, :)
        kk = [1, nx; nx+1, nx+ny; nx+ny+1, 2*nx+ny; 2*nx+ny+1, 2*(nx+ny)];
        for k = 1:4
            boundary_edges(1, kk(k,1):kk(k,2)) = Boundary_type(k);
        end
        % boundary_edges(2, :)
        l = 1:nx;
        ll = 1 : 2*ny : 2*(nx-1)*ny+1;
        for i = 1:length(l)
            boundary_edges(2, l(i)) = ll(i);
            boundary_edges(3, l(i)) = T(1, boundary_edges(2, l(i)));
            boundary_edges(4, l(i)) = T(2, boundary_edges(2, l(i)));
        end
        l = nx+1:nx+ny;
        ll = 2*(nx-1)*ny+2 : 2 : 2*nx*ny;
        for i = 1:length(l)
            boundary_edges(2, l(i)) = ll(i);
            boundary_edges(3, l(i)) = T(2, boundary_edges(2, l(i)));
            boundary_edges(4, l(i)) = T(3, boundary_edges(2, l(i)));
        end
        l = nx+ny+1:2*nx+ny;
        ll = 2*nx*ny : -2*ny : 2*ny;
        for i = 1:length(l)
            boundary_edges(2, l(i)) = ll(i);
            boundary_edges(3, l(i)) = T(3, boundary_edges(2, l(i)));
            boundary_edges(4, l(i)) = T(1, boundary_edges(2, l(i)));
        end
        l = 2*nx+ny+1:2*(nx+ny);
        ll = 2*ny-1 : -2 : 1;
        for i = 1:length(l)
            boundary_edges(2, l(i)) = ll(i);
            boundary_edges(3, l(i)) = T(3, boundary_edges(2, l(i)));
            boundary_edges(4, l(i)) = T(1, boundary_edges(2, l(i)));
        end
        
        
        if basis_type == 202
            nx = 2*nx;
            ny = 2*ny;
        end
        n = (nx+1)*(ny+1) - (nx-1)*(ny-1);
        boundary_nodes = zeros(2, n);
        
        % boundary_nodes(1, :)
        kk = [1, nx+1, nx+ny+1, 2*nx+ny+1, 2*(nx+ny)];
        k3 = find(Boundary_type == 3);
        for i = 1:length(k3)
            boundary_nodes(1, kk(k3(i)):kk(k3(i)+1)) = 3;
        end        
        k2 = find(Boundary_type == 2);
        for i = 1:length(k2)
            boundary_nodes(1, kk(k2(i)):kk(k2(i)+1)) = 2;
        end
        k1 = find(Boundary_type == 1);
        for i = 1:length(k1)
            boundary_nodes(1, kk(k1(i)):kk(k1(i)+1)) = 1;
        end
        
        % boundary_nodes(2, :)
        k = 1;
        for i = 1:nx+1
            boundary_nodes(2, k) = (i-1)*(ny+1) + 1;
            k = k + 1;
        end
        for i = 1:ny
            boundary_nodes(2, k) = boundary_nodes(2, k-1) + 1;
            k = k + 1;
        end
        for i = 1:nx
            boundary_nodes(2, k) = (nx+1-i)*(ny+1);
            k = k + 1;
        end
        for i = 1:ny-1
            boundary_nodes(2, k) = ny+1-i;
            k = k + 1;
        end
            
        

end

