:- use_module(library(scasp)).

% Define facts about common household drugs
drug(paracetamol).
drug(ibuprofen).
drug(antihistamine).
drug(cough_syrup).

drug_property(paracetamol, [pain_relief, fever_reduction]).
drug_property(ibuprofen, [pain_relief, anti_inflammatory]).
drug_property(antihistamine, [allergy_relief, sedative]).
drug_property(cough_syrup, [cough_suppression]).

% Define facts about illnesses and their symptoms
illness(migraine, [pain, inflammation]).
illness(common_cold, [cough, fever, pain]).
illness(allergic_reaction, [itching, swelling]).
illness(arthritis, [pain, inflammation]).

% Rule: A drug can treat an illness if it addresses at least one symptom of the illness
can_treat(Drug, Illness) :-
    drug(Drug),
    illness(Illness, Symptoms),
    drug_property(Drug, Properties),
    member(Symptom, Symptoms),
    member(Symptom, Properties).

% Query examples
:- begin_tests(drug_repurposing).

test(paracetamol_for_migraine) :-
    can_treat(paracetamol, migraine).

test(ibuprofen_for_arthritis) :-
    can_treat(ibuprofen, arthritis).

test(antihistamine_for_cold, [fail]) :-
    can_treat(antihistamine, common_cold).

:- end_tests(drug_repurposing).

% Query to identify potential repurposing options
?- can_treat(Drug, Illness).
