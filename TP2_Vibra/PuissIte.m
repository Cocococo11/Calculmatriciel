% la methode de la puissance iteree avec deflation de Wielandt

function [lamdag] = PuissIte(A)
%% initialisation
[n,m] = size(A);
lamdag = zeros(n,1);
lamdad = zeros(n,1);
%% iteration pour calculer toutes les valeurs propres

for i = 1:n % pour chaque vecteur propre
    %% methode de la puissance iteree pour le vecteur propre a gauche (colonnes)
    % initialisation au vecteur propre a gauche
    X = zeros(n,1);
    Y = rand(n,1)
    % iteration
    X = Y/norm(Y);
    Y = A*X;
    theta = dot(X,Y)/(norm(X)*norm(Y));  % en effet cos(theta)
    while(abs(theta) < 1-10^-7)  % critere
        X = Y/norm(Y);
        Y = A*X;
        theta = dot(X,Y)/(norm(X)*norm(Y))
        lamdag(i) = sign(theta)*norm(Y)/norm(X);  % sur la signe?
    end
    v = Y/lamdag(i);
    %% methode de la puissance iteree pour le vecteur propre a droite (lignes)  % pas sur que celle-ci marche
    % initialisation au vecteur propre a droite
    X = zeros(1,n); 
    Y = rand(1,n)
    % iteration
    X = Y/norm(Y);
    Y = X*A;
    theta = dot(X,Y)/(norm(X)*norm(Y));
    while(abs(theta) < 1-10^-7)
        X = Y/norm(Y);
        Y = X*A;
        theta = dot(X,Y)/(norm(X)*norm(Y))
        lamdad(i) = sign(theta)*norm(Y)/norm(X);
    end
    u = Y/lamdad(i); % ou simplement u = Y;
    
    %% methode avec deflation de Wielandt
    A = DeflaWie(A, lamdad(i), u, v);
    
end