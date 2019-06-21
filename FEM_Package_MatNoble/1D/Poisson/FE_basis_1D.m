 function result = FE_basis_1D(x, vertices, basis_type, basis_index, der_x)
     
     xn = vertices(1);
     xn1 = vertices(2);
     h = xn1 - xn;
     
     % 101 : 1D linear
     if basis_type == 101
        if basis_index == 1
            if der_x == 0
                result = (xn1-x)/h;
            elseif der_x == 1
                result = -1/h;
            else
                warning('wrong index for 1D linear FE!!!')
            end
        elseif basis_index == 2
            if der_x == 0
                result = (x-xn)/h;
            elseif der_x == 1
                result = 1/h;
            else
                warning('wrong index for 1D linear FE!!!')
            end
        else
            warning('wrong !!!')
        end
        % 202 : 1D quadratic
     elseif basis_type ==102
         if basis_index == 1
            if der_x == 0
                result = 2*((x-xn)/h)^2 - 3*((x-xn)/h) + 1;
            elseif der_x == 1
                result = (4*(x-xn)/h - 3)/h;
            elseif der_x == 2
                result = 4/(h^2);
            else
                warning('wrong index for 1D linear FE!!!')
            end
        elseif basis_index == 2
            if der_x == 0
                result = 2*((x-xn)/h)^2 - (x-xn)/h;
            elseif der_x == 1
                result = (4*(x-xn)/h - 1)/h;
            elseif der_x == 2
                result = 4/(h^2);
            else
                warning('wrong index for 1D linear FE!!!')
            end
        elseif basis_index == 3
            if der_x == 0
                result = -4*((x-xn)/h)^2 + 4*(x-xn)/h;
            elseif der_x == 1
                result = (-8*(x-xn)/h + 4)/h;
            elseif der_x == 2
                result = -8/(h^2);
            else
                warning('wrong index for 1D linear FE!!!')
            end
         else
             warning('wrong !!!')
        end
     end