function b = assemble_vector_1D(right_fun, Gauss_type, P, T, T_basis_test, number_of_test_local_basis,...
                                number_of_elements, vector_size, test_basis_type, test_derivative_degree)
    
    b = zeros(vector_size,1);
    
    for n=1:number_of_elements

        vertices = P(:,T(:,n));
        [Gauss_weights, Gauss_nodes] = generate_Gauss(vertices, Gauss_type);
         
        for beta=1:number_of_test_local_basis     
           int_value = Gauss_int_1D_test(right_fun, Gauss_weights, Gauss_nodes, vertices, test_basis_type, beta, test_derivative_degree);
           i = T_basis_test(beta, n);
           b(i) = b(i) + int_value;
        end

    end

end

