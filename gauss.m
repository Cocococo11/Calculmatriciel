function [X] = gauss(A,B)
%JACOBI Résolution de système par méthoded Jacobi
%   
M = diag(diag(A)); 

somme=0;

taille = size(B);
L = taille(1,1);
X0 = ones(L,1);



while (max(abs((A*X0)-B))>=0.0001)
    for i=1:L
        %Xt = zeros(L,1);
        somme =0;
        somme2=0;
        
        for j=1:i-1 

                somme2 = somme2 + A(i,j)*X0(j,1) ;
        end
        for j=i+1:L 

                somme = somme + A(i,j)*X0(j,1) ;
        end
        
        Xt(i,1)=(B(i,1)-somme-somme2)/A(i,i);
        
        
    end
    X0 = Xt
end

X=X0;

end



