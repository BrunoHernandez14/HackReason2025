% Illness Database
illness('Menstral Cramps').
illness('Influenza').
illness('Coronavirus').
illness('Hypertension').
illness('Migraine').
illness('Asthma').
illness('Arthritis').
illness('Hemorrhoids').
illness('Acid Reflux').
illness('Bronchitis').
illness('Anemia').
illness('Ezcema').
illness('Psoriasis').
illness('Indigestion').
illness('Insect Bites').
illness('Shingles').
illness('Seasonal Alergies').

% Symptoms Database
symptoms('Seasonal Alergies', ['Coughing', 'Sneezing', 'Runny Nose']).
symptoms('Menstral Cramps', ['Pain in upper abdoman', 'Cramping', 'Mood Swings', 'Nausea']).
symptoms('Coronavirus', ['Fever', 'Cold Sweats', 'Wheezing']).
symptoms('Influenza', ['Fatigue', 'Coughing', 'Mucus production', 'Fever']).
symptoms('Hypertension', ['Headache', 'Shortness of breath', 'Chest pain', 
                          'Dizziness', 'Fatigue', 'Irregular heartbeat']).
symptoms('Migraine', ['Severe headache', 'Nausea', 'Sensitivity to light', 
                      'Sensitivity to sound', 'Blurred vision']).
symptoms('Asthma', ['Shortness of breath', 'Chest tightness', 'Wheezing', 
                        'Coughing', 'Difficulty breathing', 'Fatigue']).
symptoms('Arthritis', ['Joint pain', 'Joint swelling', 'Joint stiffness']).
symptoms('Hemorrhoids', ['Bleeding during bowel movements', 'Itching', 'Swelling', 
                         'Irritation', 'Pain']).
symptoms('Acid Reflux', ['Heartburn', 'Regurgitation', 'Chest pain']).
symptoms('Bronchitis', ['Cough', 'Fatigue', 'Shortness of breath', 
                        'Mucus production', 'Sore throat']).
symptoms('Anemia', ['Fatigue', 'Weakness', 'Pale skin']).
symptoms('Ezcema', ['Itching', 'Redness', 'Dry skin', 'Swelling', 'Cracking']).
symptoms('Psoriasis', ['Red patches', 'Thick, silvery scales', 'Dry skin', 
                       'Itching', 'Burning', 'Soreness']).
symptoms('Indigestion', ['Pain or burning in the upper abdomen', 'Bloating', 
                         'Belching', 'Nausea', 'Vomiting']).
symptoms('Insect Bites', ['Redness', 'Swelling', 'Itching', 'Pain', 'Blistering']).
symptoms('Shingles', ['Pain', 'Tingling', 'Itching', 'Red rashes', 'Blisters']).

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
illness_treatment('Influenza', [cough_suppression, pain_relief, anti_nausea]).
illness_treatment('Menstrual Cramps', [pain_relief, anti_inflammatory]).
illness_treatment('Coronavirus', [cough_suppression, pain_relief, anti_nausea]).
illness_treatment('Hypertension', [blood_thinner, anti_anxiety]).
illness_treatment('Migraine', [pain_relief, anti_inflammatory, sedative]).
illness_treatment('Asthma', [decongestant, cough_suppression]).
illness_treatment('Arthritis', [pain_relief, anti_inflammatory, cooling_effect]).
illness_treatment('Hemorrhoids', [anti_inflammatory, anti_itch, wound_healing]).
illness_treatment('Acid reflux', [acid_neutralizer, digestive_aid]).
illness_treatment('Bronchitis', [cough_suppression, decongestant, throat_soothing]).
illness_treatment('Anemia', [wound_healing, digestive_aid]).
illness_treatment('Eczema', [anti_itch, skin_soothing]).
illness_treatment('Psoriasis', [anti_inflammatory, skin_soothing]).
illness_treatment('Indigestion', [digestive_aid, acid_neutralizer]).
illness_treatment('Insect bites', [anti_itch, numbing, cooling_effect]).
illness_treatment('Shingles', [pain_relief, wound_healing, anti_itch]).

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

% Prompt the user for symptoms
get_user_symptoms(UserSymptoms) :-
    write('Please enter your symptoms as a list (e.g., [\'Symptom1\', \'Symptom2\']): '), nl,
    read(UserSymptoms).

% Check if user symptoms match stored symptoms for any illness
diagnose_illness(UserSymptoms, Illness) :-
    symptoms(Illness, IllnessSymptoms),
    subset(UserSymptoms, IllnessSymptoms).

subset([], _).
subset([H|T], List) :-
    member(H, List),
    subset(T, List).

% Display possible treatments
list_treatments(IllnessTreatments) :-
    write('Here are some at home remedies: '), nl,
    forall(member(Treatment, IllnessTreatments), format('~w\n', [Treatment])).

% Main function
main :-
    write('Welcome to Re:Medical - The Definitive Drug Repurposing Tool!'), nl,
    write('Please enter a known illness (e.g., \'hypertension\', \'migraine\', etc.) or \'diagnosis\' for symptom matching: '), nl,
    read(UserInput),
    handle_user_input(NormalizedInput).

% Handle user input
handle_user_input('diagnosis') :-
    get_user_symptoms(UserSymptoms),
    (   diagnose_illness(UserSymptoms, Illness) ->
        format('Based on your symptoms, you might have ~w.\n', [Illness]),
        (   illness_treatment(Illness, Treatments) ->
            list_treatments(Treatments),
            write('Please consult a doctor for professional advice!'), nl
        ;   write('No treatments available for this illness in the database.'), nl
        )
    ;   write('No match found for your symptoms in the database.'), nl
    ).

handle_user_input(UserInput) :-
    (   illness(UserInput) ->
        format('For ~w, the following drugs can be repurposed:\n', [UserInput]),
        findall(Drug, drug_for_illness(UserInput, Drug), Drugs),
        (   Drugs \= [] ->
            check_all_interactions(Drugs),
            write('Note: Always consult a doctor before taking any medication.'), nl
        ;   write('No suitable drugs found for this illness.'), nl
        )
    ;   write('Invalid illness entered. Please try again.'), nl
    ).

% Fallback for unknown input
handle_user_input(_) :-
    write('Unknown command or input. Please try again.'), nl.

