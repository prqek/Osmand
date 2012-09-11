:- op('==', xfy, 500).
version(0).


% before each announcement (beep)
preamble - [].


%% TURNS 
turn('left', ['odbocte_doleva.ogg']).
turn('left_sh', ['odbocte_ostre_doleva.ogg']).
turn('left_sl', ['odbocte_mirne_doleva.ogg']).
turn('right', ['odbocte_doprava.ogg']).
turn('right_sh', ['odbocte_ostre_doprava.ogg']).
turn('right_sl', ['odbocte_mirne_doprava.ogg']).

pturn('left', ['doleva.ogg']).
pturn('left_sh', ['ostre_doleva.ogg']).
pturn('left_sl', ['mirne_doleva.ogg']).
pturn('right', ['doprava.ogg']).
pturn('right_sh', ['ostre_doprava.ogg']).
pturn('right_sl', ['mirne_doprava.ogg']).

pkeep('right_keep', ['se_budete_drzet_vpravo.ogg']).
pkeep('left_keep', ['se_budete_drzet_vlevo.ogg']). 
keep('right_keep', ['drzte_se_vpravo.ogg']). 
keep('left_keep', ['drzte_se_vlevo.ogg']). 
keep_after('right_keep', ['se_drzte_vpravo.ogg']). 
keep_after('left_keep', ['se_drzte_vlevo.ogg']).

prepare_turn(Turn, Dist) == ['po.ogg', D, 'budete_odbocovat.ogg', M] :-
			distance_locative(Dist) == D, pturn(Turn, M).
prepare_turn(Turn, Dist) == ['po.ogg', D, M] :-
			distance_locative(Dist) == D, pkeep(Turn, M).
turn(Turn, Dist) == ['po.ogg', D, M] :- 
			distance_locative(Dist) == D, turn(Turn, M).
turn(Turn, Dist) == ['po.ogg', D, M] :- 
			distance_locative(Dist) == D, keep_after(Turn, M).
turn(Turn) == M :- turn(Turn, M).
turn(Turn) == M :- keep(Turn, M).


prepare_make_ut(Dist) == ['po.ogg', D, 'se_budete_otacet.ogg'] :- 
		distance_locative(Dist) == D.

prepare_roundabout(Dist) == ['po.ogg', D, 'jedte_na_kruhovy_objezd.ogg'] :- 
		distance_locative(Dist) == D.

make_ut(Dist) == ['po.ogg', D, 'se_otocte.ogg'] :- 
			distance_locative(Dist) == D.
make_ut == ['otocte_se.ogg'].
make_ut_wp == ['az_to_bude_mozne_otocte_se.ogg'].

roundabout(Dist, _Angle, Exit) == ['po.ogg', D, 'jedte_na_kruhovy_objezd.ogg', 'a.ogg' , 'sjedte.ogg', E, 'vyjezdem.ogg'] :- 
			distance_locative(Dist) == D, nth_instrumental(Exit, E).
roundabout(_Angle, Exit) == ['sjedte.ogg', E, 'vyjezdem.ogg'] :- nth_instrumental(Exit, E).

and_arrive_destination == ['a_prijedete_do_cile.ogg']. 
then == ['a_potom.ogg'].
reached_destination == ['dorazili_jste_do_cile.ogg'].


bear_right == ['pokracujte_vpravo.ogg'].
bear_left == ['pokracujte_vlevo.ogg'].


route_recalc(Dist) == ['nova.ogg', 'cesta_je_dlouha.ogg', D] :- distance_nominative(Dist) == D.
route_new_calc(Dist) == ['cesta_je_dlouha.ogg', D] :- distance_nominative(Dist) == D. 

go_ahead(Dist) == ['pokracujte_rovne.ogg', D]:- distance_nominative(Dist) == D.
go_ahead == ['pokracujte_rovne.ogg'].


location_lost == ['ztrata_gps_signalu.ogg'].

%% 
nth_instrumental(1, 'prvnim.ogg').
nth_instrumental(2, 'druhym.ogg').
nth_instrumental(3, 'tretim.ogg').
nth_instrumental(4, 'ctvrtym.ogg').
nth_instrumental(5, 'patym.ogg').
nth_instrumental(6, 'sestym.ogg').
nth_instrumental(7, 'sedmym.ogg').
nth_instrumental(8, 'osmym.ogg').
nth_instrumental(9, 'devatym.ogg').
nth_instrumental(10, 'desatym.ogg').
nth_instrumental(11, 'jedenactym.ogg').
nth_instrumental(12, 'dvanactym.ogg').
nth_instrumental(13, 'trinactym.ogg').
nth_instrumental(14, 'ctrnactym.ogg').
nth_instrumental(15, 'patnactym.ogg').
nth_instrumental(16, 'sestnactym.ogg').
nth_instrumental(17, 'sedmnactym.ogg').


%%% distance measure
distance_nominative(Dist) == T :- Dist < 975, dist_nominative(Dist, F), append(F, 'metru.ogg',T).
dist_nominative(D, ['deset.ogg']) :-  D < 15, !.
dist_nominative(D, ['dvacet.ogg']) :-  D < 25, !.
dist_nominative(D, ['tricet.ogg']) :-  D < 35, !.
dist_nominative(D, ['ctyricet.ogg']) :-  D < 45, !.
dist_nominative(D, ['padesat.ogg']) :-  D < 55, !.
dist_nominative(D, ['sedesat.ogg']) :-  D < 65, !.
dist_nominative(D, ['sedmdesat.ogg']) :-  D < 75, !.
dist_nominative(D, ['osmdesat.ogg']) :-  D < 85, !.
dist_nominative(D, ['devadesat.ogg']) :-  D < 95, !.
dist_nominative(D, ['sto.ogg']) :-  D < 125, !.
dist_nominative(D, ['sto.ogg', 'padesat.ogg']) :-  D < 175, !.
dist_nominative(D, ['dveste.ogg']) :-  D < 225, !.
dist_nominative(D, ['dveste.ogg', 'padesat.ogg']) :-  D < 275, !.
dist_nominative(D, ['trista.ogg']) :-  D < 325, !.
dist_nominative(D, ['trista.ogg', 'padesat.ogg']) :-  D < 375, !.
dist_nominative(D, ['ctyrista.ogg']) :-  D < 425, !.
dist_nominative(D, ['ctyrista.ogg', 'padesat.ogg']) :-  D < 425, !.
dist_nominative(D, ['petset.ogg']) :-  D < 525, !.
dist_nominative(D, ['petset.ogg', 'padesat.ogg']) :-  D < 575, !.
dist_nominative(D, ['sestset.ogg']) :-  D < 625, !.
dist_nominative(D, ['sestset.ogg', 'padesat.ogg']) :-  D < 675, !.
dist_nominative(D, ['sedmset.ogg']) :-  D < 725, !.
dist_nominative(D, ['sedmset.ogg', 'padesat.ogg']) :-  D < 775, !.
dist_nominative(D, ['osmset.ogg']) :-  D < 825, !.
dist_nominative(D, ['osmset.ogg', 'padesat.ogg']) :-  D < 875, !.
dist_nominative(D, ['devetset.ogg']) :-  D < 925, !.
dist_nominative(D, ['devetset.ogg', 'padesat.ogg']) :- D < 975, !.


distance_nominative(Dist) == ['priblizne.ogg', 'jeden.ogg', 'kilometr.ogg'] :- Dist < 1500.
distance_nominative(Dist) == ['priblizne.ogg', 'dva.ogg', 'kilometry.ogg'] :- Dist < 2500.
distance_nominative(Dist) == ['priblizne.ogg', 'tri.ogg', 'kilometry.ogg'] :- Dist < 3500.
distance_nominative(Dist) == ['priblizne.ogg', 'ctyri.ogg', 'kilometry.ogg'] :- Dist < 4500.
distance_nominative(Dist) == ['priblizne.ogg', 'pet.ogg', 'kilometru.ogg'] :- Dist < 5500.
distance_nominative(Dist) == ['priblizne.ogg', 'sest.ogg', 'kilometru.ogg'] :- Dist < 6500.
distance_nominative(Dist) == ['priblizne.ogg', 'sedm.ogg', 'kilometru.ogg'] :- Dist < 7500.
distance_nominative(Dist) == ['priblizne.ogg', 'osm.ogg', 'kilometru.ogg'] :- Dist < 8500.
distance_nominative(Dist) == ['priblizne.ogg', 'devet.ogg', 'kilometru.ogg'] :- Dist < 9500.
distance_nominative(Dist) == ['priblizne.ogg', 'tisic.ogg', 'kilometru.ogg'] :- Dist >= 975000, Dist =< 1050000.
distance_nominative(Dist) == ['vice_nez.ogg', 'tisic.ogg', 'kilometru.ogg'] :- Dist > 1050000.
distance_nominative(Dist) == ['priblizne.ogg', X, 'kilometru.ogg'] :- D is Dist/1000, dist_nominative(D, X).

%%locative
distance_locative(Dist) == T :- Dist < 975, dist_locative(Dist, F), append(F, 'metrech.ogg',T).
dist_locative(D, ['deseti.ogg']) :-  D < 15, !.
dist_locative(D, ['dvaceti.ogg']) :-  D < 25, !.
dist_locative(D, ['triceti.ogg']) :-  D < 35, !.
dist_locative(D, ['ctyriceti.ogg']) :-  D < 45, !.
dist_locative(D, ['padesati.ogg']) :-  D < 55, !.
dist_locative(D, ['sedesati.ogg']) :-  D < 65, !.
dist_locative(D, ['sedmdesati.ogg']) :-  D < 75, !.
dist_locative(D, ['osmdesati.ogg']) :-  D < 85, !.
dist_locative(D, ['devadesati.ogg']) :-  D < 95, !.
dist_locative(D, ['sto.ogg']) :-  D < 125, !.
dist_locative(D, ['sto.ogg', 'padesati.ogg']) :-  D < 175, !.
dist_locative(D, ['dvoustech.ogg']) :-  D < 225, !.
dist_locative(D, ['dvoustech.ogg', 'padesati.ogg']) :-  D < 275, !.
dist_locative(D, ['trista.ogg']) :-  D < 325, !.
dist_locative(D, ['trista.ogg', 'padesati.ogg']) :-  D < 375, !.
dist_locative(D, ['ctyrista.ogg']) :-  D < 425, !.
dist_locative(D, ['ctyrista.ogg', 'padesati.ogg']) :-  D < 475, !.
dist_locative(D, ['petistech.ogg']) :-  D < 525, !.
dist_locative(D, ['petiset.ogg', 'padesati.ogg']) :-  D < 575, !.
dist_locative(D, ['sestistech.ogg']) :-  D < 625, !.
dist_locative(D, ['sestistech.ogg', 'padesati.ogg']) :-  D < 675, !.
dist_locative(D, ['sedmistech.ogg']) :-  D < 725, !.
dist_locative(D, ['sedmistech.ogg', 'padesati.ogg']) :-  D < 775, !.
dist_locative(D, ['osmistech.ogg']) :-  D < 825, !.
dist_locative(D, ['osmistech.ogg', 'padesati.ogg']) :-  D < 875, !.
dist_locative(D, ['devitistech.ogg']) :-  D < 925, !.
dist_locative(D, ['devitistech.ogg', 'padesati.ogg']) :-  D < 975, !.

distance_locative(Dist) == ['priblizne.ogg', 'jednom.ogg', 'kilometru.ogg'] :- Dist < 1500.
distance_locative(Dist) == ['priblizne.ogg', 'dvou.ogg', 'kilometrech.ogg'] :- Dist < 2500.
distance_locative(Dist) == ['priblizne.ogg', 'trech.ogg', 'kilometrech.ogg'] :- Dist < 3500.
distance_locative(Dist) == ['priblizne.ogg', 'ctyrech.ogg', 'kilometrech.ogg'] :- Dist < 4500.
distance_locative(Dist) == ['priblizne.ogg', 'peti.ogg', 'kilometrech.ogg'] :- Dist < 5500.
distance_locative(Dist) == ['priblizne.ogg', 'sesti.ogg', 'kilometrech.ogg'] :- Dist < 6500.
distance_locative(Dist) == ['priblizne.ogg', 'sedmi.ogg', 'kilometrech.ogg'] :- Dist < 7500.
distance_locative(Dist) == ['priblizne.ogg', 'osmi.ogg', 'kilometrech.ogg'] :- Dist < 8500.
distance_locative(Dist) == ['priblizne.ogg', 'deviti.ogg', 'kilometrech.ogg'] :- Dist < 9500.
distance_locative(Dist) == ['priblizne.ogg', 'tisici.ogg', 'kilometrech.ogg'] :- Dist >= 975000, Dist =< 1050000.
distance_locative(Dist) == ['vice_nez.ogg', 'tisici.ogg', 'kilometrech.ogg'] :- Dist > 1050000.
distance_locative(Dist) == ['priblizne.ogg', X, 'kilometrech.ogg'] :- D is Dist/1000, dist_locative(D, X).

%% resolve command main method
%% if you are familar with Prolog you can input specific to the whole mechanism,
%% by adding exception cases.
flatten(X, Y) :- flatten(X, [], Y), !.
flatten([], Acc, Acc).
flatten([X|Y], Acc, Res):- 
		flatten(Y, Acc, R), flatten(X, R, Res).
flatten(X, Acc, [X|Acc]).

resolve(X, Y) :- resolve_impl(X,Z), flatten(Z, Y).
resolve_impl([],[]).
resolve_impl([X|Rest], List) :- resolve_impl(Rest, Tail), ((X == L) -> append(L, Tail, List); List = Tail).
