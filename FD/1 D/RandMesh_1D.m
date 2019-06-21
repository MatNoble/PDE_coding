function x = RandMesh_1D( xx, N_b, p )

        x1 = xx(1);
        xn = xx(2);
        x = zeros(1, N_b-2);
        hh = (xn-x1)/(N_b-1);
        for i = 1:N_b-2
            x(i) = x1 + i*hh + (2*rand(1)-1)*p*hh;
        end
        x = [x1,x,xn];

end

