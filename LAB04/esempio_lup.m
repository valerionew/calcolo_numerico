
%% costruisco una matrice casuale
%% quadrata di ordine n, per facilitare
%% la visualizzazione scelgo tutti
%% coefficienti interi
n = 10;
A = randi ([1, 10], n)

%% per poter conoscere la soluzione
%% esatta del sistema A x = b, scelgo io
%% stesso la soluzione x e calcolo il termine
%% noto di conseguenza
xex = randi ([1, 10], n, 1)
b = A * xex

[L,U,p] = lup (A)

%% il vettore p tiene traccia di tutti
%% gli scambi di riga effettuati nel
%% procedimento di pivoting, per ottenere
%% una soluzione corretta devo effettuare
%% gli stessi scambi anche nel termine noto
b = b(p)

%% una volta nota la fattorizzazione
%% posso risolvere il sistema lineare
%% tramite due passi di sostituzione
%% il comando 'mldivide' è in grado di
%% riconoscere che le matrici L ed U
%% sono triangolari ed applicare il
%% metodo appropriato in ciascun caso
x = U \ (L \ b);

%% controllo la correttezza della soluzione
x - xex

%% il risultato non è nullo, perchè???
