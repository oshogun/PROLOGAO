genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).


genitor(liz,bill).

genitor(pat, jim).
genitor(vovozao, vovo).
genitor(vovo, papai).
genitor(papai, bb).


mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).
homem(vovozao).
homem(vovo).
homem(papai).
homem(bb).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

tio(X,Y) :- genitor(GenitorY, Y), irmao(X, GenitorY), homem(X).
tia(X,Y) :- genitor(GenitorY, Y), irma(X, GenitorY), mulher(X).

primo(X,Y) :- genitor(TioY, X), genitor(TioX, Y), irmaos(TioX,TioY), homem(X).
prima(X,Y) :- genitor(TioY, X), genitor(TioX, Y), irmaos(TioX,TioY), mulher(X).

primos(X,Y) :- (primo(X,Y); prima(X,Y)), X \== Y.

bisavo(X,Y) :- genitor(X, AvoY), genitor(AvoY, PaiY), pai(PaiY, Y), homem(X).
bisavoh(X,Y) :- genitor(X, AvoY), genitor(AvoY, PaiY), pai(PaiY, Y), mulher(X).

descendente(X, Y) :- genitor(Y, X).
descendente(X, Y) :- genitor(Z, X), descendente(Z, Y).

feliz(X) :- genitor(X, _).