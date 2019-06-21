
function [Su, Au] = FD_Heat_1D_forward(u, f, xx, t, N_b, N_t, p_x, p_t)
        
        x = RandMesh_1D( xx, N_b, p_x );
        detalx = diff(x);
        t = RandMesh_1D(t, N_t, p_t);
        detalt = diff(t);
        k = detalt(1)/(detalx(1)^2)
        A = Matrix( k, N_b );
        
        Su = zeros(N_t, N_b);
        Su(1, :) = feval(u, 0, x);
        Su(:, 1) = feval(u, t, xx(1));
        Su(:, end) = feval(u, t, xx(2));
        
        for i = 2:N_t
            b0 = (detalt(1) * feval(f, t(i-1), x(2:end-1)))';
            b1 = [Su(i, 1); b0 ;Su(i, end)];
            b2 = Su(i-1, 2:end-1)';
            b3 = [0;b2;0];
            Su(i, :) = ( A * Su(i-1, :)' + b1 + b3 )';
        end
        
        [X, T] = meshgrid(x, t);
        Au = feval(u, T, X);
        
        subplot(2,1,1)
        surfc(X, T, Au)
        xlabel('X')
        ylabel('T')
        title('Analy Solution')
        subplot(2,1,2)
        surfc(X, T, Su)
        xlabel('X')
        ylabel('T')
        title('s Solution')
        
        
end