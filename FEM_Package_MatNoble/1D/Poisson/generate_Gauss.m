function [Gauss_weights, Gauss_nodes] = generate_Gauss(vertices, Gauss_type)

    if Gauss_type==4
        Gauss_coefficient_reference_1D=[0.3478548451,0.3478548451,0.6521451549,0.6521451549];
        Gauss_point_reference_1D=[0.8611363116,-0.8611363116,0.3399810436,-0.3399810436];
    elseif Gauss_type==8
        Gauss_coefficient_reference_1D=[0.1012285363,0.1012285363,0.2223810345,0.2223810345,0.3137066459,0.3137066459,0.3626837834,0.3626837834];
        Gauss_point_reference_1D=[0.9602898565,-0.9602898565,0.7966664774,-0.7966664774,0.5255324099,-0.5255324099,0.1834346425,-0.1834346425];
    elseif Gauss_type==2
        Gauss_coefficient_reference_1D=[1,1];
        Gauss_point_reference_1D=[-1/sqrt(3),1/sqrt(3)];
    end

    upper_bound = vertices(2);
    lower_bound = vertices(1);
    Gauss_weights = (upper_bound-lower_bound)*Gauss_coefficient_reference_1D/2;
    Gauss_nodes = (upper_bound-lower_bound)*Gauss_point_reference_1D/2+(upper_bound+lower_bound)/2;

end

