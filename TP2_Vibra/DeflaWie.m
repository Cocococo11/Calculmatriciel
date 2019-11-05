% la methode de deflation de Wielandt
function [A] = DeflaWie(A,lamdad,u,v) % lamdad 
A = A - lamdad*(v*u)/(u*v);  % l'ordre de v*u ne peut pas etre change 
end