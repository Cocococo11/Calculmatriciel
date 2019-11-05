% equation : A*X=B , X0 valeur initiale , decomposer A = D + R avec M = D , N = R.
% pre-condition : A est inversible ET a diagonale strictement dominante.

function [X] = Jacobi(A,B)
%% initialisation
M = diag(diag(A)); % diagonale de matrice A
N = A - M; % reste de matrice D
rangA=size(A,1); 
X0 = zeros(rangA,1); % initialisation de X0 (peu importe)
%% iteration  % alog ameliore
while(max(abs(A*X0-B))>0.00001) 
    SX(:,1) = N * X0(:,1);  % calculer la somme de a_ij*x_j1 avec R
    for i = 1:rangA
        X(i,1) = (B(i,1) - SX(i,1)) / M(i,i);   %rapprocher la valeur
    end
    X0 = X;  % nouvelle initialisation
end
end

