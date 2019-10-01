function [X] = jacobi(A,B)
%JACOBI Résolution de système par méthoded Jacobi
%   
M = diag(diag(A)); 

somme=0;

taille = size(B);
l = taille(1,1);
X0 = ones(l,1);



while (min(abs((A.*X0)-B))>=0.0001)
    for i=1:l
        Xt = zeros(l,1);
        for j=1:l 
            if (j~=i)
        
                somme = A(i,j).*X0(j,1) ;
            end
        end
        Xt(i,1)=(B(i,1)-somme)./A(i,i);
        
        
    end
    X0 = Xt;
end

X=X0;

end



