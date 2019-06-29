
function [Nu, Au, k] = FD_Heat_1D(u, f, xx, t, N_b, N_t, p_x, p_t, class)
        
        x = RandMesh_1D( xx, N_b, p_x );
        detalx = diff(x);
        t = RandMesh_1D(t, N_t, p_t);
        detalt = diff(t);
        k = detalt(1)/(detalx(1)^2);
        A = Matrix( k, N_b, class );
        
        Nu = zeros(N_t, N_b);
        Nu(1, :) = feval(u, 0, x);
        Nu(:, 1) = feval(u, t, xx(1));
        Nu(:, end) = feval(u, t, xx(2));
        
        [X, T] = meshgrid(x, t);
        Au = feval(u, T, X);
        
        if class == 1 % 5 points Forward_Euler
            for i = 2:N_t
                b0 = (detalt(1) * feval(f, t(i-1), x(2:end-1)))';
                b1 = [Nu(i, 1); b0 ;Nu(i, end)];
                b2 = Nu(i-1, 2:end-1)';
                b3 = [0;b2;0];
                Nu(i, :) = ( A * Nu(i-1, :)' + b1 + b3 )';
            end
        elseif class == 2 % 3 points Back_Euler
            for i = 2:N_t
                b = zeros(N_b, 1);
                b(1) = Nu(i,1);
                b(end) = Nu(i,end);
                b(2:N_b-1) = (detalx(1)^2)*feval(f, t(i), x(2:end-1))' + (1/k)*Nu(i-1,2:end-1)';
                Nu(i,:) = (A \ b)';
            end
        elseif class == 3 % C_N
            for i = 2:N_t
                b1 = zeros(N_b, 1);
                k1 = feval(f, t(i-1), x(2:end-1));
                k2 = feval(f, t(i-1)+detalt(1)/2, x(2:end-1));
                k3 = feval(f, t(i-1)+detalt(1)/2, x(2:end-1));
                k4 = feval(f, t(i), x(2:end-1));
                b1(2:N_b-1) = 2*detalt(1)*((k1+k4+2*(k2+k3))'/6);
                b2 = A(:,:,2) * Nu(i-1,:)';
                b3 = zeros(N_b, 1);
                b3(1) = Nu(i,1);
                b3(end) = Nu(i,end);
                b = b1 + b2 + b3;
                Nu(i, :) = (A(:,:,1) \ b)';
            end
        end

        figure(class)
        subplot(2,1,1)
        surfc(X, T, Au)
        xlabel('X')
        ylabel('T')
        title('Analysis Solution')
        subplot(2,1,2)
        surfc(X, T, Nu)
        xlabel('X')
        ylabel('T')
        title('Numerical Solution')
        
        
end