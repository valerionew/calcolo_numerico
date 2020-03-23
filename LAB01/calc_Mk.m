function Mk = calc_Mk(k)
    % creaimo la diagonale di matrici
    Mk = diag(2 .^ (1./([1:2.*k+1])));
    
    % Selezioniamo un elemento sì e uno no ([2:2:2*k])
    % della matrice, calcoliamo il vettore da attaccare
    % e lo inseriamo in una nuova colonna (2.*(k+1))
    Mk( [2:2:2*k] , (2.*(k+1)) ) = calc_vk([0:k-1])';
    
    Mk( (2.*(k+1)) , [1:2:2*(k+1)] ) = calc_vk([0:k])';
    Mk( (2.*(k+1)) , [2:2:2*(k+1)] ) = calc_vk([0:k])';
    
end