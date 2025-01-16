% Drug Database
drug_property(paracetamol, [pain_relief, fever_reduction]).
drug_property(ibuprofen, [pain_relief, anti_inflammatory]).
drug_property(antihistamine, [allergy_relief, anti_hives]).
drug_property(cough_syrup, [cough_suppression, throat_soothing]).
drug_property(aspirin, [pain_relief, blood_thinner, anti_inflammatory]).
drug_property(menthol_cream, [pain_relief, cooling_effect]).
drug_property(nasal_spray, [decongestant]).
drug_property(baking_soda, [acid_neutralizer, anti_itch]).
drug_property(honey, [cough_suppression, wound_healing]).
drug_property(ginger, [anti_nausea, anti_inflammatory]).
drug_property(chamomile_tea, [sedative, anti_anxiety]).
drug_property(aloe_vera, [skin_soothing, wound_healing]).
drug_property(apple_cider_vinegar, [acid_neutralizer, digestive_aid]).
drug_property(vapor_rub, [cough_suppression, decongestant]).
drug_property(clove_oil, [pain_relief, numbing]).
drug_property(witch_hazel, [anti_itch, anti_inflammatory]).
drug_property(oatmeal_bath, [skin_soothing, anti_itch]).

% Illness Treatment Map (indicating which drug properties help which illnesses)
illness_treatment('diabetes', [wound_healing, anti_inflammatory]).
illness_treatment('hypertension', [blood_thinner, anti_anxiety]).
illness_treatment('migraine', [pain_relief, anti_inflammatory, sedative]).
illness_treatment('asthma', [decongestant, cough_suppression]).
illness_treatment('arthritis', [pain_relief, anti_inflammatory, cooling_effect]).
illness_treatment('hemorrhoids', [anti_inflammatory, anti_itch, wound_healing]).
illness_treatment('acid reflux', [acid_neutralizer, digestive_aid]).
illness_treatment('bronchitis', [cough_suppression, decongestant, throat_soothing]).
illness_treatment('anemia', [wound_healing, digestive_aid]).
illness_treatment('eczema', [anti_itch, skin_soothing]).
illness_treatment('psoriasis', [anti_inflammatory, skin_soothing]).
illness_treatment('indigestion', [digestive_aid, acid_neutralizer]).
illness_treatment('insect bites', [anti_itch, numbing, cooling_effect]).
illness_treatment('shingles', [pain_relief, wound_healing, anti_itch]).

% Drug Interaction Database
drug_interaction(paracetamol, alcohol).
drug_interaction(aspirin, ibuprofen).
drug_interaction(antihistamine, alcohol).
drug_interaction(nasal_spray, decongestant).
drug_interaction(honey, aspirin).

% Check for Drug Interactions
check_interactions(Drug1, Drug2) :-
    (   drug_interaction(Drug1, Drug2)
    ;   drug_interaction(Drug2, Drug1) ),
    format('Warning: ~w and ~w may interact negatively.\n', [Drug1, Drug2]).

% Display Drug Interaction Warnings for a List of Drugs
check_all_interactions([]).
check_all_interactions([_]).
check_all_interactions([Drug1, Drug2 | Rest]) :-
    check_interactions(Drug1, Drug2),
    check_all_interactions([Drug1 | Rest]),
    check_all_interactions([Drug2 | Rest]).

% Match drugs to illnesses based on their properties
drug_for_illness(Illness, Drug) :-
    illness_treatment(Illness, NeededProperties),
    drug_property(Drug, DrugProperties),
    intersection(NeededProperties, DrugProperties, MatchedProperties),
    MatchedProperties \= [],  % Ensure at least one property matches
    format('~w can be repurposed for ~w: ~w\n', [Drug, Illness, MatchedProperties]).

% Helper to find intersection of two lists
intersection([], _, []).
intersection([H|T], List, [H|Rest]) :-
    member(H, List),
    intersection(T, List, Rest).
intersection([_|T], List, Rest) :-
    intersection(T, List, Rest).

% Main function
main :-
    write('Welcome to Re:Medical - The Definitive Drug Repurposing Tool!'), nl,
    write('Please enter an illness (e.g., \'diabetes\'): '), nl,
    read(UserInput),
    (   illness_treatment(NormalizedIllness, _)
    ->  format('For ~w, the following drugs can be repurposed:\n', [NormalizedIllness]),
        findall(Drug, drug_for_illness(NormalizedIllness, Drug), Drugs),
        (   Drugs \= []
        ->  check_all_interactions(Drugs),
            write('Note: Always consult a doctor before taking any medication.'), nl
        ;   write('No suitable drugs found for this illness.'), nl
        )
    ;   write('Sorry, the illness is not in our database.'), nl
    ).
