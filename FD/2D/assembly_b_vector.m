function b = assembly_b_vector( N_m, f, P )
        
        b = zeros(N_m, 1);
        for i = 1:N_m
            b(i) = feval(f, P(1, i), P(2, i));
        end
        
end

