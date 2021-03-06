function int_value = Gauss_int_1D_trial_test(coe_fun, Gauss_weights, Gauss_nodes, vertices,...
                                             basis_type_trial, basis_index_trial, der_x_trial,...
                                             basis_type_test, basis_index_test, der_x_test)

    Gpn = length(Gauss_weights);
    int_value = 0;
    for k = 1:Gpn
        int_value = int_value + Gauss_weights(k)*feval(coe_fun, Gauss_nodes(k))*...
            FE_basis_1D(Gauss_nodes(k), vertices, basis_type_trial, basis_index_trial, der_x_trial)*...
            FE_basis_1D(Gauss_nodes(k), vertices, basis_type_test, basis_index_test, der_x_test);
    end
end