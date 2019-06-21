function b = assemble_vector_2D(right_fun, P, T, T_basis_test, number_of_test_local_basis,...
                                Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle,...
                                number_of_elements, vector_size, test_basis_type, der_x_test, der_y_test)
    
    b = zeros(vector_size,1);
    
    for n=1:number_of_elements

        vertices = P(:,T(:,n));
        [Gauss_weights, Gauss_nodes] = generate_Gauss_local_triangle(Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle, vertices);
         
        for beta=1:number_of_test_local_basis     
           int_value = Gauss_int_2D_test(right_fun, Gauss_weights, Gauss_nodes, vertices, test_basis_type, beta, der_x_test, der_y_test);
           i = T_basis_test(beta, n);
           b(i) = b(i) + int_value;
        end

    end

end

