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
illness('Incest Sting').
illness('Shingles').

% Symptoms Database
symptoms('Diabetes', ['Increased thirst', 'Frequent urination', 'Extreme hunger', 
                      'Unexplained weight loss', 'Fatigue', 'Blurred vision', 'Slow-healing sores']).
symptoms('Hypertension', ['Headache', 'Shortness of breath', 'Chest pain', 
                          'Dizziness', 'Fatigue', 'Irregular heartbeat']).
symptoms('Migraine', ['Severe headache', 'Nausea', 'Sensitivity to light', 
                      'Sensitivity to sound', 'Blurred vision']).

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

% Main function
main :-
    write('Welcome to the Re:Medical, please enter your symptoms!'), nl,
    get_user_symptoms(UserSymptoms),
    (   diagnose_illness(UserSymptoms, Illness)
    ->  format('Based on your symptoms, you might have ~w.\n', [Illness]),
    ;   write('Your symptoms do not match any known illnesses in the database.'), nl,
    ).
