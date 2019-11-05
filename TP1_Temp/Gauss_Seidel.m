% equation : A*X=B , X0 valeur initiale , decomposer A = M + N avec M = D + L, N = U.
% pre-condition : A est inversible ET a diagonale strictement dominante.

function [X] = Gauss_Seidel(A,B)
%% initialisation
L = size(A,1); 
M = zeros(L);
for i = 1:L
    for j = 1:L
        if(i>=j)
            M(i,j) = A(i,j); % M la partie diagonale et en dessous de A 
        end
    end
end
R = A - diag(diag(A)); % faiciliter le calcul de SX;
N = A - M; % U la partie au dessus de A
X0 = zeros(L,1); % initialisation de X0 (peu importe)
%% iteration  % alog ameliore
while(max(abs(A*X0-B))>0.00001) 
    SX(:,1) = R * X0(:,1);  % calculer la somme de a_ij*x_j1 avec R
    for i = 1:L
        X(i,1) = (B(i,1) - SX(i,1)) / M(i,i);   %rapprocher la valeur
    end
    X0 = X;  % nouvelle initialisation
end

end

