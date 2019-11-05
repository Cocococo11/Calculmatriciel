% equation : A*X=B , X0 valeur initiale , decomposer A = D + L + U.
% pre-condition : A est inversible ET a diagonale strictement dominante.
% a finir;
%% Note: 
% 1. inv() qui est prefere et \  pour la division des matrices   cf:help inv -> slash
% 2. nominage pour fasilite la comprehension;
% 3. division de matrice n'est pas comunicative;
function [X] = Relaxation(A,B)
%% initialisation
sizeA = size(A,1); 
D = diag(diag(A)); % diagonale
L = zeros(sizeA);  % lower part
for i = 1:sizeA
    for j = 1:sizeA
        if(i>j)
            L(i,j) = A(i,j); % M la partie triangle en dessous de A 
        end
    end
end
U = A - D - L; % upper part

omega = 1; % 0 < omega < 2
PI = inv(D + omega * L) * ((1-omega) * D - omega * U); % formule fournie

X0 = zeros(sizeA,1); % initialisation de X0 (peu importe)
%% iteration
% while(max(abs(A*X0-B))>0.00001) 
%     SX(:,1) = R * X0(:,1);  % calculer la somme de a_ij*x_j1 avec R
%     for i = 1:sizeA
%         X(i,1) = (B(i,1) - SX(i,1)) / L(i,i);   %rapprocher la valeur
%     end
%     X0 = X;  % nouvelle initialisation
% end

end

