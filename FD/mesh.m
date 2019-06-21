function [ x, y, X, Y ] = mesh( bx, by, h_x, h_y )

        x = bx(1): h_x : bx(2);
        y = by(1) : h_y : by(2);
        [X, Y] = meshgrid(x, y);

end

