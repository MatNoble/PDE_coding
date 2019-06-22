function A = Matrix( k, n, class )

        if class == 1
            A = ((6*k^2-5*k)/2) * eye(n);
            A = A + ((2*k*(2-3*k))/3) * diag(ones(n-1,1),1) + ((2*k*(2-3*k))/3) * diag(ones(n-1,1),-1);
            A = A + (-(k*(1-6*k))/12) * diag(ones(n-2,1),2) + (-(k*(1-6*k))/12) * diag(ones(n-2,1),-2);
            
            A(2, :) = 0;           
            A(2, 2) = -2*k;
            A(2, [1 , 3]) = k;
            
            A(n-1, :) = 0;
            A(n-1, [n-2, n]) = k;
            A(n-1, n-1) = -2*k;
            
            A(1, :) = 0;
            A(end, :) = 0;
        elseif class == 2
            A = (2+1/k) * eye(n);
            A = A - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);
            A(1,:) = 0;
            A(end,:) = 0;
            A(1,1) = 1;
            A(end,end) = 1;
        elseif class == 3
            A(:,:,1) = (2+2*k)*eye(n);
            A(:,:,1) = A(:,:,1) - k*diag(ones(n-1,1),1) - k*diag(ones(n-1,1),-1);
            A(1,:,1) = 0;
            A(1,1,1) = 1;
            A(end,:,1) = 0;
            A(end,end,1) = 1;
            
            A(:,:,2) = (2-2*k)*eye(n);
            A(:,:,2) = A(:,:,2) + k*diag(ones(n-1,1),1) + k*diag(ones(n-1,1),-1);
            A(1,:,2) = 0;
            A(end,:,2) = 0;
        end

end

