function junction = junction_point( n_x, n_y, index_x, index_y, Mesh)
        
        if Mesh == 3
            junction = zeros(3, 4*index_y);
            % 1
            n1 = index_x * n_y;
            a = 1:index_y;
            junction(1, a) = 1;
            b1 = n_y * (index_x-1) + 1 : n_y * (index_x-1) + index_y;
            junction(2, a) = b1;
            b2 = n1 + 1 : n1 + index_y;
            junction(3, a) = b2;
            % 2
            nn = (n_x + 1)/2 + 1;
            n2 = nn*index_y;
            a = index_y + 1:2*index_y;
            junction(1, a) = 2;
            b1 = n1 - index_y + 1 : n1;
            junction(2, a) = b1;
            b2 = n1 + n2 + 1 : n1 + n2 + index_y;
            junction(3, a) = b2;
            % 3
            n3 = n2;
            a = 2*index_y + 1:3*index_y;
            junction(1, a) = 3;
            b1 = n1 + n2 - index_y +1 : n1 + n2;
            junction(3, a) = b1;
            b2 = n1 + n2 + n3 + 1 :  n1 + n2 + n3 + index_y;
            junction(2, a) = b2;
            % 4
            a = 3*index_y + 1:4*index_y;
            junction(1, a) = 4;
            b1 = n1 + n2 + n3 - index_y +1 : n1 + n2 + n3;
            junction(3, a) = b1;
            b2 = n1 + n2 + n3 + n_y - index_y + 1 :  n1 + n2 + n3 + n_y;
            junction(2, a) = b2;
        elseif Mesh == 2
            junction = [0;0;0];
        end
end

