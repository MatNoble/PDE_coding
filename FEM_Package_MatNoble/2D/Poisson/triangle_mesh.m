function [] = triangle_mesh( nx, ny, P, T, X, Y )

    figure(1)  
    plot(X,Y,'k-','linewidth',2),hold on,     plot(X',Y','k-','linewidth',2),hold on
    for i = 1:nx*ny
        j = 2*i - 1;
        global_index1 = T(2, j);
        global_index2 = T(3, j);
        x1 = P(1, global_index1); y1 = P(2, global_index1);
        x2 = P(1, global_index2); y2 = P(2, global_index2);
        line([x1, x2],[y1, y2],'linewidth',2,'color','k'), hold on
    end
    hold off
    axis equal
    axis off
    
end

