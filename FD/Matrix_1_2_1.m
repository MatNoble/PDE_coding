function A = Matrix_1_2_1( n )

        A = 2*eye(n);
        A = A - diag(ones(n-1,1),-1) - diag(ones(n-1,1),1);
%         for i = 1:n-1
%             A(i, i+1) = -1;
%         end
%         A = A + A';

end

