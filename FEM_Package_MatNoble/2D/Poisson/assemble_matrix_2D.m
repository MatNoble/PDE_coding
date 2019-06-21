 function A = assemble_matrix_2D(coe_fun, matrix_size, P, T, Tb_trial, Tb_test, number_of_elements,...
                                 number_of_local_basis_functions_trial, number_of_local_basis_functions_test, ...
                                 Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle,...
                                 basis_type_trial, der_x_trial, der_y_trial, basis_type_test, der_x_test, der_y_test)

    A = sparse(matrix_size(1), matrix_size(2));
    
     for n = 1:number_of_elements
         
         vertices = P(:,T(:,n));
         [Gauss_weights, Gauss_nodes] = generate_Gauss_local_triangle(Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle, vertices);
         
         for alpha = 1:number_of_local_basis_functions_trial
             for beta = 1:number_of_local_basis_functions_test
                 int_value = Gauss_int_2D_trial_test(coe_fun, Gauss_weights, Gauss_nodes, vertices, ....
                                                   basis_type_trial, alpha, der_x_trial, der_y_trial,...
                                                   basis_type_test, beta, der_x_test, der_y_test);
                 i = Tb_test(beta, n);
                 j = Tb_trial(alpha, n);
                 k = A(sub2ind(size(A), i, j)) + int_value;
                 A(sub2ind(size(A), i, j)) = k;
             end
         end
     end
 end