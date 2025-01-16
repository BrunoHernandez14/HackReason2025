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
illness_treatment('Diabetes', [wound_healing, anti_inflammatory]).
illness_treatment('Hypertension', [blood_thinner, anti_anxiety]).
illness_treatment('Migraine', [pain_relief, anti_inflammatory, sedative]).
illness_treatment('Asthma', [decongestant, cough_suppression]).
illness_treatment('Arthritis', [pain_relief, anti_inflammatory, cooling_effect]).
illness_treatment('Hemorrhoids', [anti_inflammatory, anti_itch, wound_healing]).
illness_treatment('Acid Reflux', [acid_neutralizer, digestive_aid]).
illness_treatment('Bronchitis', [cough_suppression, decongestant, throat_soothing]).
illness_treatment('Anemia', [wound_healing, digestive_aid]).
illness_treatment('Eczema', [anti_itch, skin_soothing]).
illness_treatment('Psoriasis', [anti_inflammatory, skin_soothing]).
illness_treatment('Indigestion', [digestive_aid, acid_neutralizer]).
illness_treatment('Insect Bites', [anti_itch, numbing, cooling_effect]).
illness_treatment('Shingles', [pain_relief, wound_healing, anti_itch]).

% Match drugs to illnesses based on their properties
drug_for_illness(Illness, Drug) :-
    illness_treatment(Illness, NeededProperties),
    drug_property(Drug, DrugProperties),
    intersection(NeededProperties, DrugProperties, MatchedProperties),
    MatchedProperties \= [],  % Ensure at least one property matches
    format('~w can be repurposed for ~w due to its properties: ~w\n', [Drug, Illness, MatchedProperties]).

% Helper to find intersection of two lists
intersection([], _, []).
intersection([H|T], List, [H|Rest]) :-
    member(H, List),
    intersection(T, List, Rest).
intersection([_|T], List, Rest) :-
    intersection(T, List, Rest).

% Main function
main :-
    write('Welcome to Drug Repurposing Tool!'), nl,
    write('Please enter the illness for which you need repurposed drug suggestions (e.g., \'Diabetes\'): '), nl,
    read(Illness),
    (   illness_treatment(Illness, _)
    ->  format('For ~w, the following drugs can be repurposed:\n', [Illness]),
        forall(drug_for_illness(Illness, Drug), true)
    ;   write('Sorry, the illness is not in our database.'), nl
    ).
