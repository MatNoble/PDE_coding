function [P, T, Pb, Tb] = generate_PT_2D(nx, ny, N_m, N_mn, X, Y, X1, Y1, basis_type)
% N_m: number of mesh elements
% N_mn : number of mesh nodes

    P = zeros(2, N_mn);
    for i = 1:nx+1
        ii = i-1;
        a = ii*ny + i;
        b = i*ny + i;
        P(1,a:b) = X(:,i)';
    end
    
    for i = 1:nx+1
        ii = i-1;
        a = ii*ny + i;
        b = i*ny + i;
        P(2,a:b) = Y(:,i)';
    end
    
    T = zeros(3, N_m);
    k = 1;
    for i = 1:nx
        global_index1 = (i-1)*(ny+1)+1:i*(ny+1)-1;
        global_index2 = i*(ny+1)+1:(i+1)*(ny+1)-1;
        for j = 1:ny
            T(1, k) = global_index1(j);
            T(3, k) = T(1, k) + 1;
            T(1, k+1) = T(1, k) + 1;
            
            T(2, k) = global_index2(j);
            T(2, k+1) = T(2, k);
            T(3, k+1) = T(2, k) + 1;
            
            k = k+2;
        end
    end
    
    if basis_type == 201
        Pb = P;
        Tb = T;
    elseif basis_type == 202
            Pb = zeros(2, (2*nx+1)*(2*ny+1));
            for i = 1:2*nx+1
                ii = i-1;
                a = ii*2*ny + i;
                b = i*2*ny + i;
                Pb(1,a:b) = X1(:,i)';
            end

            for i = 1:2*nx+1
                ii = i-1;
                a = ii*2*ny + i;
                b = i*2*ny + i;
                Pb(2,a:b) = Y1(:,i)';
            end
            
            Tb = zeros(6, N_m);
            k = 1;
            for i = 1:nx
                
                global_index1 = 2*(i-1)*(2*ny+1)+1 : 2 : (2*i-1)*(2*ny+1)-2;
                global_index2 = 2*i*(2*ny+1)+1 : 2 : (2*i+1)*(2*ny+1)-2;
                global_index3 = (2*i-1)*(2*ny+1)+1 : 2 : 2*i*(2*ny+1)-2;
                
                for j = 1:ny
                    Tb(1, k) = global_index1(j);
                    Tb(6, k) = Tb(1, k) + 1;
                    Tb(3, k) = Tb(1, k) + 2;
                    Tb(1, k+1) = Tb(3, k);

                    Tb(2, k) = global_index2(j);
                    Tb(2, k+1) = Tb(2, k);
                    Tb(3, k+1) = Tb(2, k) + 2;
                    Tb(5, k+1) = Tb(2, k) + 1;
                    
                    Tb(4, k) = global_index3(j);
                    Tb(5, k) = Tb(4, k) + 1;
                    Tb(4, k+1) = Tb(5, k);
                    Tb(6, k+1) = Tb(4, k+1) + 1;
                                       
                    k = k+2;
                end
            end
            
    end
      
end

