function [P, T, Pb, Tb] = generate_PT(x1, xn, h, N_mn, basis_type)

    P = zeros(1,N_mn);
    P(1) = x1;
    P(N_mn) = xn;
    for i = 2:N_mn-1
        P(i) = P(i-1) + h(i);
    end
    % T
    T = zeros(2,N_mn-1);
    T(1,:) = 1:N_mn-1;
    T(2,:) = T(1,:) + 1;
    
    if basis_type == 101
        % Pb
        Pb = P;
        % Tb
        Tb = T;
    elseif basis_type == 102
        % Pb
        N = 2*N_mn - 1;
        PP = zeros(1,N);
        for i = 1:N_mn
            ii = 2*i -1;
            PP(ii) = P(i);
        end
        for i = 2:2:2*N_mn-2
            PP(i) = (PP(i-1) + PP(i+1))/2;
        end
        Pb = PP;
        % Tb
        N = N_mn-1;
        Tb = zeros(3,N);
        Tb(1,:) = 1:2:2*N-1;
        Tb(2,:) = 3:2:2*N+1;
        Tb(3,:) = 2:2:2*N;
    end
      
end

