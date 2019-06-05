% problema 3
divisivel(N, K) :- N mod K =:= 0.

% Consultas exemplo:
%
% ?- divisivel(2,2).
% saída: true
% ?- divisivel(128, 64).
% saída: true
% ?- divisivel(2, 3);.
% saída: false

% problema 4
formamTriangulo(A,B,C) :-
    A + B > C,
    A + C > B,
    B + C > A.

% Consultas exemplo:
%
% ?- formamTriangulo(7,10,5).
% saida: true
% ?- formamTriangulo(1,2,3).
% saida: false
% ?- formamTriangulo(6,6,6).
% saida: true

eqSegundoGrau(A, B, C, ValorX) :-
    Delta is (B ^ 2) - 4 * A * C, 
    Delta < 0,
    ValorX is false.

eqSegundoGrau(A, B, C, ValorX) :-
    Delta is (B ^ 2) - 4 * A * C,
    Delta =:= 0,
    ValorX = (0 - B) / 2 * A.

eqSegundoGrau(A, B, C, ValorX) :-
    Delta is (B ^ 2) - 4 * A * C,
    Delta > 0,
    X1 is (0 - B) + (sqrt(Delta) / 4*A),
    X2 is (- B) - (sqrt(Delta) / 4*A),
    ValorX is [X1, X2].