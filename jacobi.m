function [X] = jacobi(A,B)
%JACOBI Résolution de système par méthoded Jacobi
%   
M = diag(diag(A)); 
X = M ;

taille = size(B);
l = taille(1,1);
X0 = ones(l,1);

while (min(abs(A.*X0-B))>=0.01)
    for i=1:l
        for j=1:l
        Xt = zeros(l,1);
        somme = A(i,j).*X0(j,1) ;   
        Xt(i,1)=(B(i,1)-somme)/A(i,i);
        
        end
    end
    X0 = Xt;
end
    
    







end

