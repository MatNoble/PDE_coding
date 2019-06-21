function [Gauss_coefficient_local_triangle,Gauss_point_local_triangle] = generate_Gauss_local_triangle(Gauss_coefficient_reference_triangle,Gauss_point_reference_triangle,vertices)

        x1 = vertices(1,1);  y1 = vertices(2,1);
        x2 = vertices(1,2);  y2 = vertices(2,2);
        x3 = vertices(1,3);  y3 = vertices(2,3);
        
        Jacobi = abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
        
        Gauss_coefficient_local_triangle = Gauss_coefficient_reference_triangle*Jacobi;
        
        Gauss_point_local_triangle(:,1) = x1 +...
                                          (x2-x1)*Gauss_point_reference_triangle(:,1) +...
                                          (x3-x1)*Gauss_point_reference_triangle(:,2);
                                      
        Gauss_point_local_triangle(:,2) = y1 +...
                                          (y2-y1)*Gauss_point_reference_triangle(:,1) +...
                                          (y3-y1)*Gauss_point_reference_triangle(:,2);
        
end