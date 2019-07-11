?- use_module(library(clpfd)).

% Descrição do problema tradicional de sudoku 4x4, usando constraints.
% O tabuleiro é descrito como uma lista de listas, cada lista representando
% uma linha do tabuleiro.
sudoku4x4(Rows) :-
        length(Rows, 4), 
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), 
        Vs ins 1..4,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [[A1, A2, A3, A4],
                [B1, B2, B3, B4],
                [C1, C2, C3, C4],
                [D1, D2, D3, D4]],
        blocks([A1, A2, A3, A4], [B1, B2, B3, B4]),
        blocks([C1, C2, C3, C4], [D1, D2, D3, D4]).
% Predicados que preenchem, recursivamente, as linhas do sudoku.
blocks([], []).
blocks([N1,N2|Ns1], [N3,N4|Ns2]) :-
        all_distinct([N1,N2,N3,N4]),
        blocks(Ns1, Ns2).

% Problema de compare sudoku 4x4. Recebe uma lista de regras para comparar
% os elementos do tabuleiro e invoca os predicados correspondentes.
compare4x4(Rows, Rules) :-
    sudoku4x4(Rows),
    Rows = [[A1, A2, A3, A4],
                [B1, B2, B3, B4],
                [C1, C2, C3, C4],
                [D1, D2, D3, D4]],
    length(Rules, 16),
    Rules = [A1A2, A3A4, B1A1, B2A2,
             B3A3, B4A4, B1B2, B3B4,
             C1C2, C3C4, D1C1, D2C2,
             D3C4, D4C4, D1D2, D3D4],
    call(A1A2, A1, A2),
    call(A3A4, A3, A4),
    call(B1A1, B1, A1),
    call(B2A2, B2, A2),
    call(B3A3, B3, A3),
    call(B4A4, B4, A4),
    call(B1B2, B1, B2),
    call(B3B4, B3, B4),
    call(C1C2, C1, C2),
    call(C3C4, C3, C4),
    call(D1C1, D1, C1),
    call(D2C2, D2, C2),
    call(D3C4, D3, C4),
    call(D4C4, D4, C4),
    call(D1D2, D1, D2),
    call(D3D4, D3, D4).
% Exemplo de input:
% ?- Rules = [l, g, g, g, l, l, g, l, l, g, l, l, g, g, g, l],
% compare4x4(Rows,Rules),maplist(label,Rows), maplist(portray_clause,Rows).

% Idêntico ao sudoku 4x4, porém com 6x6 elementos. 
sudoku6x6(Rows) :-
        length(Rows, 6),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), 
        Vs ins 1..6,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [[A1, A2, A3, A4, A5, A6],
                [B1, B2, B3, B4, B5, B6],
                [C1, C2, C3, C4, C5, C6],
                [D1, D2, D3, D4, D5, D6],
                [E1, E2, E3, E4, E5, E6],
                [F1, F2, F3, F4, F5, F6]],
        blocks([A1, A2, A3, A4, A5, A6], [B1, B2, B3, B4, B5, B6], [C1, C2, C3, C4, C5, C6]),
        blocks([D1, D2, D3, D4, D5, D6], [E1, E2, E3, E4, E5, E6], [F1, F2, F3, F4, F5, F6]).

blocks([], [], []).
blocks([N1,N2|Ns1], [N3,N4|Ns2], [N5, N6|Ns3]) :-
        all_distinct([N1,N2,N3,N4, N5, N6]),
        blocks(Ns1, Ns2, Ns3).

% Idêntico ao compare 4x4, porém para o tabuleiro 6x6
compare6x6(Rows, Rules) :-
    sudoku6x6(Rows),
    Rows = [[A1, A2, A3, A4, A5, A6],
                [B1, B2, B3, B4, B5, B6],
                [C1, C2, C3, C4, C5, C6],
                [D1, D2, D3, D4, D5, D6],
                [E1, E2, E3, E4, E5, E6],
                [F1, F2, F3, F4, F5, F6]],
    Rules = [A1A2, A3A4, A5A6,
            B1A1, B2A2, B3A3, B4A4, B5A5, B6A6,
            B1B2, B3B4, B5B6,
            C1B1, C2B2, C3B3, C4B4, C5B5, C6B6,
            C1C2, C3C4, C5C6,
            D1D2, D3D4, D5D6,
            E1D1, E2D2, E3D3, E4D4, E5D5, E6D6,
            E1E2, E3E4, E5E6,
            F1E1, F2E2, F3E3, F4E4, F5E5, F6E6,
            F1F2, F3F4, F5F6],
    call(A1A2, A1, A2),
    call(A3A4, A3, A4),
    call(A5A6, A5, A6),
    call(B1A1, B1, A1),
    call(B2A2, B2, A2),
    call(B3A3, B3, A3),
    call(B4A4, B4, A4),
    call(B5A5, B5, A5),
    call(B6A6, B6, A6),
    call(B1B2, B1, B2),
    call(B3B4, B3, B4),
    call(B5B6, B5, B6),
    call(C1B1, C1, B1),
    call(C2B2, C2, B2),
    call(C3B3, C3, B3),
    call(C4B4, C4, B4),
    call(C5B5, C5, B5),
    call(C6B6, C6, B6),
    call(C1C2, C1, C2),
    call(C3C4, C3, C4),
    call(C5C6, C5, C6),
    call(D1D2, D1, D2),
    call(D3D4, D3, D4),
    call(D5D6, D5, D6),
    call(E1D1, E1, D1),
    call(E2D2, E2, D2),
    call(E3D3, E3, D3),
    call(E4D4, E4, D4),
    call(E5D5, E5, D5),
    call(E6D6, E6, D6),
    call(E1E2, E1, E2),
    call(E3E4, E3, E4),
    call(E5E6, E5, E6),
    call(F1E1, F1, E1),
    call(F2E2, F2, E2),
    call(F3E3, F3, E3),
    call(F4E4, F4, E4),
    call(F5E5, F5, E5),
    call(F6E6, F6, E6),
    call(F1F2, F1, F2),
    call(F3F4, F3, F4),
    call(F5F6, F5, F6).

% Os dois predicados de comparação que são usados pelo compare sudoku
g(A, B) :- A #> B. % greater
l(A, B) :- A #< B. % lesser

% Exemplo de input para o sudoku 6x6
% ?- Rules = [l, l, g, g, l, g, l, l, g, g, g, l, l, l, g, g, g, l, g, g, g, l, l, l, g, l, g, g, l, l, g, l, l, l, g, g, l, g, l, l, g, g],
% compare6x6(Rows,Rules),maplist(label,Rows), maplist(portray_clause,Rows).
