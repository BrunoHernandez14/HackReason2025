:- dynamic illness/1, symptoms/2.

% Illness and Symptoms Lists

illness('Period Cramps'). symptoms('Period Cramps', 
    ['Pain in the lower abdomen', 'Pain in the lower back', 'Pain in the thighs', 'Nausea', 'Vomiting', 'Fatigue', 'Headache']).
    
illness('Fevers'). symptoms('Fevers', 
    ['High Fever', 'Sweating', 'Chills', 'Shivering', 'Weakness']).
    
illness('Diabetes'). symptoms('Diabetes', 
    ['Increased thirst', 'Frequent urination', 'Extreme hunger', 'Fatigue', 'Blurred vision']).
    
illness('Migraine'). symptoms('Migraine', 
    ['Severe headache', 'Nausea', 'Sensitivity to light', 'Pulsating pain', 'Fatigue']).
    
illness('Hypertension'). symptoms('Hypertension', 
    ['Headache', 'Shortness of breath', 'Nosebleeds', 'Dizziness', 'Chest pain']).
    
illness('Anemia'). symptoms('Anemia', 
    ['Fatigue', 'Pale skin', 'Irregular heartbeats', 'Shortness of breath', 'Dizziness']).
    
illness('Asthma'). symptoms('Asthma', 
    ['Shortness of breath', 'Chest tightness', 'Wheezing', 'Coughing', 'Anxiety']).
    
illness('Shingles'). symptoms('Shingles', 
    ['Pain', 'Burning', 'Tingling', 'Red rash', 'Fever']).
    
illness('Acid Reflux'). symptoms('Acid Reflux', 
    ['Heartburn', 'Chest pain', 'Difficulty swallowing', 'Regurgitation', 'Nausea']).
    
illness('Arthritis'). symptoms('Arthritis', 
    ['Joint pain', 'Stiffness', 'Swelling', 'Fatigue', 'Tenderness']).
    
illness('Bronchitis'). symptoms('Bronchitis', 
    ['Cough', 'Production of mucus', 'Fatigue', 'Shortness of breath', 'Chest discomfort']).

% Access Symptom List
