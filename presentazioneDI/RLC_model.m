function dydt = RLC_model(t, y, C, R1, R2, L, Vi)
%  IN -----UUUUU---\/\/\/----+----------+-- OUT
%            L       R1      |          |
%                            \         _|_
%                        R2  /         ___ C
%                            \          |
%                           _|_        _|_
%                           \ /        \ /

A = [   -1/(R2*C)    1/C     ; 
        -1/L         -R1/L   ];
B = [0 ; 1/L];
    
dydt = A * y + B*Vi(t);

end