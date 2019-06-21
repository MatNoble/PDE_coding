function [Gauss_coefficient_reference_triangle, Gauss_point_reference_triangle] = generate_Gauss_reference_triangle(Gauss_point_number)

        if Gauss_point_number == 3
            Gauss_coefficient_reference_triangle = [1/6, 1/6, 1/6];
            Gauss_point_reference_triangle = [1/2, 0; 1/2, 1/2; 0, 1/2];
        elseif Gauss_point_number == 4 
            Gauss_coefficient_reference_triangle = [(1-1/sqrt(3))/8, (1-1/sqrt(3))/8, (1+1/sqrt(3))/8, (1+1/sqrt(3))/8];
            Gauss_point_reference_triangle=[(1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1+1/sqrt(3))/4; (1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1-1/sqrt(3))/4;...
                                            (-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1+1/sqrt(3))/4; (-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1-1/sqrt(3))/4];
        elseif Gauss_point_number == 9
            Gauss_coefficient_reference_triangle = [64/81*(1-0)/8, 100/324*(1-sqrt(3/5))/8, 100/324*(1-sqrt(3/5))/8, 100/324*(1+sqrt(3/5))/8,...
                                                    100/324*(1+sqrt(3/5))/8, 40/81*(1-0)/8, 40/81*(1-0)/8, 40/81*(1-sqrt(3/5))/8, 40/81*(1+sqrt(3/5))/8];
            Gauss_point_reference_triangle = [(1+0)/2,(1-0)*(1+0)/4; (1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+sqrt(3/5))/4;...
                                            (1+sqrt(3/5))/2,(1-sqrt(3/5))*(1-sqrt(3/5))/4; (1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+sqrt(3/5))/4;...
                                            (1-sqrt(3/5))/2,(1+sqrt(3/5))*(1-sqrt(3/5))/4; (1+0)/2,(1-0)*(1+sqrt(3/5))/4;...
                                            (1+0)/2,(1-0)*(1-sqrt(3/5))/4; (1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+0)/4; (1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+0)/4];
        end
end