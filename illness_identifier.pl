:- module(illness_identifier, other)

% Illness Database
illness('Diabetes').
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

% Symptoms Database
symptoms('Diabetes', ['Increased thirst', 'Frequent urination', 'Extreme hunger', 
                      'Unexplained weight loss', 'Fatigue', 'Blurred vision', 'Slow-healing sores']).
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

% Display possible treaments
list_treatements(IllnessTreatments) :-
    write('Here are some at home remedies: '), nl,
    forall(member(Treatment, IllnessTreatments), format('~w\n', [Treatment])).

% Main function
other :-
    write('Please enter your symptoms for a diagnosis: '), nl,
    get_user_symptoms(UserSymptoms),
    (   diagnose_illness(UserSymptoms, Illness)
    ->  format('Based on your symptoms, you might have ~w.\n', [Illness]), 
        list_treatements([Illness]),
        write('Please consult a doctor though!'), nl
    ;   write('Your symptoms do not match any known illnesses in the database.'), nl
    ).
