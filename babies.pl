% Nome: Guilherme Christopher Michaelsen Cardoso
% Matricula: 14100831

% Módulos para aritmética
?- use_module(library(clpb)).
?- use_module(library(clpfd)).

% Predicado sobre os berços e as caracteristicas dos bebês
solution(Bs, Macs, Noms, Pes, Alts, Sigs, Moms) :-
        % Variaveis inteiras representando as caracteristicas dos bebes
        % e mapeadas em uma lista de listas
        Table   = [Macacao, Nome, Peso, Altura, Signo, Mae],
        Macacao  = [Amarelo, Azul, Branco, Verde, Vermelho],
        Nome = [Caue,Edgar,Italo,Leonardo,Rodrigo],
        Peso   = [P63,P65,P67,P69,P71],
        Altura = [A58,A60,A62,A64,A66],
        Signo  = [Cancer,Capricornio,Escorpiao,Touro,Virgem],
        Mae = [Angelica, Elisa, Leticia, Paloma, Renata],
        % rotulos para as variaveis, para melhor legibilidade da saída
        Macacoes  = [amarelo, azul, branco, verde, vermelho],
        Nomes = [caue,edgar,italo,leonardo,rodrigo],
        Pesos   = [p63,p65,p67,p69,p71],
        Alturas = [a58,a60,a62,a64,a66],
        Signos  = [cancer,capricornio,escorpiao,touro,virgem],
        Maes = [angelica, elisa, leticia, paloma, renata],
        pairs_keys_values(Macs, Macacao, Macacoes),
        pairs_keys_values(Noms, Nome, Nomes),
        pairs_keys_values(Pes, Peso, Pesos),
        pairs_keys_values(Alts, Altura, Alturas),
        pairs_keys_values(Sigs, Signo, Signos),
        pairs_keys_values(Moms, Mae, Maes),
        % mapeando numeros de 1 a 5 na tabela, representando os berços
        maplist(all_distinct, Table),
        append(Table, Bs),
        Bs ins 1..5,
        % as dicas do quebra cabeça, representadas como relações entre
        % variaveis numericas
        % O bebê de macacão Verde está em algum lugar entre o Rodrigo e o filho da Letícia, nessa ordem.
        Verde #> Rodrigo, 
        Verde #< Leticia,
        % Ítalo está ao lado do bebê de 60 cm.
        next_to(Italo, A60),
        % O bebê que nasceu em setembro está exatamente à esquerda do bebê de 60 cm.
        Virgem #= A60 - 1,
        % O filho da Angélica está em uma das pontas.
        extremidade(Angelica),
        % A criança de menor estatura está ao lado do filho da Elisa.
        next_to(Elisa, A58),
        % O bebê de 64 cm pesa 6,9 kg.
        A64 #= P69,
        % O filho da Renata está exatamente à esquerda do bebê de 62 cm.
        Renata #= A62 - 1,
        % Na quinta posição está o bebê de Capricórnio.
        Capricornio #= 5,
        % A criança de macacão Vermelho está em algum lugar à esquerda do bebê mais pesado.
        Vermelho #< P71,
        % Leonardo pesa 6,7 Kg.
        Leonardo #= P67,
        % O bebê do signo de Virgem está exatamente à direita do filho da Paloma.
        Virgem #= Paloma + 1,
        % A criança de macacão Branco está em algum lugar à esquerda da criança de macacão Azul.
        Branco #< Azul,
        % O filho da Letícia está exatamente à direita da criança de Touro.
        Leticia #= Touro + 1,
        % O bebê de macacão Verde está em algum lugar entre a criança de 66 cm e o filho de Elisa, nessa ordem.
        A66 #< Verde,
        Verde #< Elisa,
        % Leonardo é do signo de Câncer.
        Leonardo #= Cancer,
        % Na terceira posição está o bebê de 6,9 Kg.
        P69 #= 3,
        % Cauê está exatamente à direita do bebê de 58 cm.
        Caue #= A58 + 1,
        % O bebê de macacão Amarelo está na terceira posição.
        Amarelo #= 3,
        % A criança de 6,9 Kg está exatamente à esquerda da criança de 6,3 Kg.
        P69 #= P63 - 1,
        % O bebê de macacão Verde está em algum lugar à direita do bebê de macacão Branco.
        Verde #> Branco.

% predicados auxiliares para descrição das dicas
next_to(H, N) :- abs(H-N) #= 1.
extremidade(5).
extremidade(1).

% exemplo de query:
% ? - solution(Bs, Macs, Noms, Pes, Alts, Sigs, Moms), label(Bs).
% Bs = [3, 5, 1, 2, 4, 3, 4, 5, 2|...],
% Macs = [3-amarelo, 5-azul, 1-branco, 2-verde, 4-vermelho],
% Noms = [3-caue, 4-edgar, 5-italo, 2-leonardo, 1-rodrigo],
% Pes = [4-p63, 1-p65, 2-p67, 3-p69, 5-p71],
% Alts = [2-a58, 4-a60, 5-a62, 3-a64, 1-a66],
% Sigs = [2-cancer, 5-capricornio, 1-escorpiao, 4-touro, 3-virgem],
% Moms = [1-angelica, 3-elisa, 5-leticia, 2-paloma, 4-renata] 