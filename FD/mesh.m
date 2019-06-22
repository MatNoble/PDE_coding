function [ x, y, X, Y ] = mesh( bx, by, h_x, h_y )

        x = bx(1)+h_x: h_x : bx(2)-h_x;
        y = by(1)+h_y : h_y : by(2)-h_y;
        [X, Y] = meshgrid(x, y);

end

