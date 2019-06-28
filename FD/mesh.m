function [ x, y, X, Y, XX, YY  ] = mesh( bx, by, h_x, h_y )

        x = bx(1)+h_x: h_x : bx(2)-h_x;
        y = by(1)+h_y : h_y : by(2)-h_y;
        [X, Y] = meshgrid(x, y);
        
        x1 = bx(1): h_x : bx(2);
        y1 = by(1): h_y : by(2);
        [XX, YY] = meshgrid(x1, y1);

end

