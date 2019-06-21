function int_value = Gauss_int_1D_test(right_fun, Gauss_weights, Gauss_nodes,...
                                       vertices, test_basis_type, basis_index_test, test_derivative_degree)
    
    Gpn = length(Gauss_weights);
    int_value = 0;
    
    for k = 1:Gpn
        int_value = int_value + Gauss_weights(k)*feval(right_fun, Gauss_nodes(k))*...
                    FE_basis_1D(Gauss_nodes(k), vertices, test_basis_type, basis_index_test, test_derivative_degree);
    end
    
end

