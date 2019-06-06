% problema 3
divisivel(N, K) :- N mod K =:= 0.

% Consultas exemplo:
%
% ?- divisivel(2,2).
% true
% ?- divisivel(128, 64).
% true
% ?- divisivel(2, 3);.
% false

% problema 4
formamTriangulo(A,B,C) :-
    A + B > C,
    A + C > B,
    B + C > A.

% Consultas exemplo:
%
% ?- formamTriangulo(7,10,5).
% true
% ?- formamTriangulo(1,2,3).
% false
% ?- formamTriangulo(6,6,6).
% true

% Problema 5
eqSegundoGrau(A, B, C, ValorX) :-
    Delta is (B ^ 2) - 4 * A * C, 
    Delta < 0,
    ValorX is false.

eqSegundoGrau(A, B, C, ValorX) :-
    Delta is (B ^ 2) - 4 * A * C,
    Delta =:= 0,
    ValorX = (0 - B) / 2 * A.

eqSegundoGrau(A, B, C, ValorX1, ValorX2) :-
    Delta is (B ^ 2) - 4 * A * C,
    Delta > 0,
    X1 is (- B) + (sqrt(Delta) / 4*A),
    X2 is (- B) - (sqrt(Delta) / 4*A),
    ValorX1 is X1,
    ValorX2 is X2.

% Consulta exemplo
%
% ?- eqSegundoGrau(1, -10, 24, X1, X2).
% X1 = 10.5,
% X2 = 9.5.

% Problema 6

potencia(X, Y, Resultado) :- Resultado is X ^ Y.

% Consulta exemplo
%
% ?-  potencia(2,3,X).
% X = 8.;

% Problema 7

absoluto(N,X) :- N >= 0, X is N , !; N < 0, X is - N.

% Consulta exemplo

%
% ?- absoluto(-3, X).
% X = 3.
%
% ?- absoluto(3, X).
% X = 3.

% Problema 8

areaTriangulo(B, A, X) :- X is (B * A) / 2.

% Consulta exemplo
%
% ?- areaTriangulo(25,33,X).
% X = 412.5.

% Problema 9

xor(A,B) :- not(A), B ; A, not(B).

% Consulta exemplo
%
% ?- xor(true, true).
% false.
%
% ?- xor(false, false).
% false.
%
% ?- xor(true, false).
% true.

aprovado(A, B, C) :- 
    Media is (A + B + C) / 3,
    Media >= 6.0.

% Consulta exemplo:
% ?- aprovado(5, 10, 7).
% true.
%
% ?- aprovado(5, 10, 2).
% false.


% Problema 11
:- table fib/2.
fib(N, K) :-
    N =:= 0, K is 0, !;
    N =:= 1, K is 1, !;
    fib(N - 1, F1),
    fib(N - 2, F2),
    K is F1 + F2.

% Consultas exemplo:
%
% ?- fib(1, K).
% K = 1.
%
% ?- fib(2, K).
% K = 1.
%
% ?- fib(3, K).
% K = 2.
%
% ?- fib(4, K).
% K = 3.
%
% ?- fib(5, K).
% K = 5.
%
% ?- fib(6, K).
% K = 8.

% problema 12

distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2), Dist) :-
    Dist is sqrt((X2 - X1)^2 + (Y2 - Y1)^2 + (Z2 - Z1)^2).

% consulta exemplo:
%
% ?- distancia3D(ponto(2,3,5), ponto(4,4,2), D).
% D = 3.7416573867739413.

% problema 13
maior(A,B,C,X) :- 
    A >= B, A >= C, X = A, !;
    B >= A, B >= C, X = B, !;
    C >= A, C >= B, X = C.

% Consultas exemplo
% ?- maior(1,2,3, X).
% X = 3.
%
% ?- maior(2,1,3, X).
% X = 3.
%
% ?- maior(3,1,2, X).
% X = 3.
%
% ?- maior(2,3,1, X).
% X = 3.

% Problema 14
operacao(Op,X,Y,Resultado) :-
    Op == +, Resultado is X + Y, !;
    Op == -, Resultado is X - Y, !;
    Op == *, Resultado is X * Y, !;
    Op == /, Resultado is X / Y.

% Consultas exemplo
% ?- operacao(+, 2, 3, X).
% X = 5.
%
% ?- operacao(-, 2, 3, X).
% X = -1.
%
% ?- operacao(*, 2, 3, X).
% X = 6.
%
% ?- operacao(/, 2, 3, X).
% X = 0.6666666666666666.
    