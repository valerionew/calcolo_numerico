k = 0;
zero = 1/2;
while (0 + zero) > 0
  zero_old = zero;
  zero = zero / 2;
  k = k + 1;
end

% Nota bene: realmin e' il piu' piccolo numero positivo in virgola mobile !normalizzato!

% Il piu' piccolo numero positivo in virgola mobile e' invece un numero !denormalizzato! 
zero_old % < realmin
k
