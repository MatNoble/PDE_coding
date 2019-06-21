function int_value = Gauss_int_2D_test(right_fun, Gauss_weights, Gauss_nodes,...
                                       vertices, test_basis_type, basis_index_test, der_x_test, der_y_test)
    
    Gpn = length(Gauss_weights);
    int_value = 0;
    
    for k = 1:Gpn
        int_value = int_value + Gauss_weights(k)*feval(right_fun, Gauss_nodes(k, 1), Gauss_nodes(k, 2))*...
                    FE_basis_2D(Gauss_nodes(k, 1), Gauss_nodes(k, 2), vertices, test_basis_type, basis_index_test, der_x_test, der_y_test);
    end
    
end

