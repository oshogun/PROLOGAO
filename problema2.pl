% Alunos que cursam disciplina 
estuda(jorge, ine1234).
estuda(henrizes, ine5454).
estuda(matias, ine1234).
estuda(rafael, mtm3333).
estuda(henrizes, mtm3333).

% Professores que lecionam disciplinas
leciona(jurema, ine5454).
leciona(jurema, mtm3333).
leciona(pedro, ine1234).

% A é professor de B se A leciona uma disciplina que B estuda
professorDe(A, B) :- leciona(A, Z), estuda(B,Z), A \== B.

% Dois estudantes são colegas se estudam disciplinas em comum e não são o mesmo aluno
colegas(A, B) :- estuda(A, D), estuda(B, D), A \== B.

% A é aluno de B se B é professor de A
alunoDe(A, B) :- professorDe(B, A).

% Consultas:
%
% Todas as disciplinas lecionadas por jurema:
% ?- leciona(jurema, X).
% saída:
% X = ine5454 ; X = mtm3333
%
% Todos os alunos de pedro:
% ?- professorDe(pedro, X).
% saída:
% X = jorge ; X matias.
%
% pedro e matias são colegas?
% ?- colegas(pedro, matias).
% saída: false
%
% jorge e matias são colegas?
% ?- colegas(jorge, matias)
% saída: true
%
% henrizes é aluno de jurema?
% ?- alunoDe(henrizes, jurema)
% saída: true