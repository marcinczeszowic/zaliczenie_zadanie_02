% Atomy

kazimierz_II_sprawiedliwy.
leszek_bialy.
konrad_I_mazowiecki.
boleslaw.
boleslaw_V_wstydliwy.
kazimierz_I.
siemowit.
leszek_czarny.
siemomysl.
wladyslaw_I_lokietek.
kazimierz_III_wielki.
kazimierz_II.
siemowit_2.
wladyslaw_garbaty.
boleslaw2.
leszek.
przemysl.
kazimierz_III.
wladyslaw_bialy.
ksiazeta_mazowieccy.

/*  parent ( child, parent).  */

parent(leszek_bialy,kazimierz_II_sprawiedliwy).
parent(leszek_bialy,wifi1).

parent(konrad_I_mazowiecki,kazimierz_II_sprawiedliwy).
parent(konrad_I_mazowiecki,wifi1).

parent(boleslaw,konrad_I_mazowiecki).
parent(boleslaw,wifi2).

parent(kazimierz_I,konrad_I_mazowiecki).
parent(kazimierz_I,wifi2).

parent(siemowit,konrad_I_mazowiecki).
parent(siemowit,wifi2).
parent(boleslaw_V_wstydliwy,konrad_I_mazowiecki).
parent(boleslaw_V_wstydliwy,wifi2).
parent(leszek_czarny,kazimierz_I).
parent(leszek_czarny,wifi3).
parent(siemomysl,kazimierz_I).
parent(siemomysl,wifi3).
parent(wladyslaw_I_lokietek,kazimierz_I).
parent(wladyslaw_I_lokietek,wifi4).
parent(kazimierz_II,kazimierz_I).
parent(kazimierz_II,wifi5).
parent(siemowit,kazimierz_I).
parent(siemowit,wifi5).
parent(leszek,siemomysl).
parent(leszek,wifi6).
parent(przemysl,siemomysl).
parent(przemysl,wifi6).
parent(kazimierz_III,siemomysl).
parent(kazimierz_III,wifi7).
parent(kazimierz_III_wielki,wladyslaw_I_lokietek).
parent(kazimierz_III_wielki,wifi8).
parent(wladyslaw_garbaty,siemowit_2).
parent(wladyslaw_garbaty,wifi9).
parent(boleslaw2,siemowit_2).
parent(boleslaw2,wifi10).
parent(wladyslaw_bialy,kazimierz_III).
parent(wladyslaw_bialy,wifi11).
parent(ksiazeta_mazowieccy,siemowit).
parent(ksiazeta_mazowieccy,wifi12).

male(kazimierz_II_sprawiedliwy).
male(leszek_bialy).
male(konrad_I_mazowiecki).
male(boleslaw).
male(kazimierz_I).
male(siemowit).
male(leszek_czarny).
male(siemomysl).
male(wladyslaw_I_lokietek).
male(kazimierz_III_wielki).
male(kazimierz_II).
male(siemowit_2).
male(wladyslaw_garbaty).
male(boleslaw2).
male(leszek).
male(przemysl).
male(kazimierz_III).
male(wladyslaw_bialy).
male(ksiazeta_mazowieccy).
male(boleslaw_V_wstydliwy).

female(wifi1).
female(wifi2).
female(wifi3).
female(wifi4).
female(wifi5).
female(wifi6).
female(wifi7).
female(wifi8).
female(wifi9).
female(wifi10).
female(wifi11).
female(wifi12).

father(X, Y) :- male(Y), parent(X, Y).
mother(X, Y) :- female(Y), parent(X, Y).
brother(X, Y) :- male(Y), father(X, Father), father(Y, Father), Y \= X,mother(X, Mother), mother(Y, Mother).
grandfather(X, Y) :- male(Y), parent(X, Z), parent(Z, Y).
greatgrandfather(X,Y) :-grandfather(X,Z), parent(Z,Y),male(Y).
greatgreatgrandfather(X,Y) :- greatgrandfather(X,Z), parent(Z,Y),male(Y).
greatgreatgreatgrandfather(X,Y) :- greatgreatgrandfather(X,Z), parent(Z,Y),male(Y).
ancestor(X,Y) :- parent(X,Y).
ancestor2(X,Y) :- parent(X,Z), ancestor(Z,Y),male(Y).

grand_child:- grandfather(X, Y),format(' ~w is grandchild ~w\n',[X,Y]),fail.
great_grand_child:- greatgrandfather(X,Y),format(' ~w is great grandchild ~w\n',[X,Y]),fail.
ancestor_family:- ancestor2(X,Y),format(' ~w is ancestor ~w\n',[X,Y]),fail.
great_great_grand_child:-greatgreatgrandfather(X,Y),format(' ~w is great great grandchild ~w\n',[X,Y]),fail.
great_great_great_grand_child:-greatgreatgreatgrandfather(X,Y),format(' ~w is great great great grandchild ~w\n',[X,Y]),fail.

father_1:- father(X,Y),format('~w is father ~w\n',[X,Y]),fail.
brother_1:- brother(X, Y),format('~w is brother ~w\n',[X,Y]),fail.
son_1:- father(X,kazimierz_II_sprawiedliwy),format(' ~w\n',[X]),fail.
son_2:- father(X,konrad_I_mazowiecki),format(' ~w\n',[X]),fail.
son_3:- father(X,kazimierz_I),format(' ~w\n',[X]),fail.
son_4:- father(X,siemomysl),format(' ~w\n',[X]),fail.
son_5:- father(X,wladyslaw_I_lokietek),format(' ~w\n',[X]),fail.
son_6:- father(X,siemowit_2),format(' ~w\n',[X]),fail.
son_7:- father(X,kazimierz_III),format(' ~w\n',[X]),fail.

start:- write('On the picture we will see Dynasty of Piastowie kujawscy'),nl,
	write('At the head of a dynasty is:'),nl,
    write('kazimierz_II_sprawiedliwy'),nl,
	write('The next members of the family are two brothers:'),nl,
	son_1;
	write('the next branch in the dynasty are the children of konrad_I_mazowiecki :'),nl,
	son_2;
	write('the next branch in the dynasty are the children of kazimierz_I :'),nl,
	son_3;
	write('the next branch in the dynasty are the children of siemomysl :'),nl,
	son_4;
	write('and wladyslaw_I_lokietek :'),nl,
	son_5;
    write('and siemowit :'),nl,
	son_6;
	write('last branch in the dynasty are the children of kazimierz_III :'),nl,
	son_7;
	write('-------------------------'),nl,
	write('also we can show who is who grandchild:'),nl,
    grand_child;
	write('also we can show who is who great grandchild:'),nl,
    great_grand_child;
    write('also we can show who is who great great grandchild:'),nl,
    great_great_grand_child;
    write('also we can show who is who great great great grandchild:'),nl,
    great_great_great_grand_child;    
	write('also we can show who is who ancestor:'),nl,
    ancestor_family.