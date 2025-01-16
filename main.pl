:- dynamic illness/1, symptoms/2.

% Illness List
    illness('Period Cramps').
    illness('Fevers').
    illness('Diabetes').
    illness('Migraine').
    illness('Hypertension').
    illness('Anemia').
    illness('Asthma').
    illness('Shingles').
    illness('Acid Reflux').
    illness('Arthritis').
    illness('Bronchitis').
    
% The symptoms associated with the illness
    symptoms('Period Cramps' , ['Pain in the lower abdomen', 'Pain in the lower back', 'Pain in the thighs', 'Nausea', 'Vomiting', 'Diarrhea', 'Fatigue', 
    'Weakness', 'Headache', 'Dizziness', 'Sweating', 'Fainting', 'Loose stools', 'Constipation', 'Bloating', 'Breast tenderness', 'Acne', 'Mood swings', 
    'Irritability', 'Depression', 'Anxiety', 'Trouble sleeping', 'Appetite changes', 'Food cravings', 'Weight gain', 'Joint or muscle pain', 'Fever', 
    'Chills', 'Hot']).
    symptoms('Fevers', ['High Fever', 'Headache', 'Sweating', 'Chills', 'Shivering', 'Muscle aches', 'Loss of appetite', 'Dehydration', 'Weakness']).
    symptoms('Diabetes', ['Increased thirst', 'Frequent urination', 'Extreme hunger', 'Unexplained weight loss', 'Presence of ketones in the urine', 
    'Fatigue', 'Irritability', 'Blurred vision', 'Slow-healing sores', 'Frequent infections', 'Areas of darkened skin']).
    symptoms('Migraine', ['Severe headache', 'Nausea', 'Vomiting', 'Sensitivity to light', 'Sensitivity to sound', 'Blurred vision', 'Lightheadedness', 
    'Fainting', 'Aura', 'Throbbing pain', 'Pulsating pain', 'Pain on one side of the head', 'Neck stiffness', 'Fatigue', 'Difficulty concentrating']).
    symptoms('Hypertension', ['Headache', 'Shortness of breath', 'Nosebleeds', 'Flushing', 'Dizziness', 'Chest pain', 'Visual changes', 'Blood in the urine', 
    'Fatigue', 'Confusion', 'Irregular heartbeat', 'Pounding in chest, neck, or ears']).
    symptoms('Anemia', ['Fatigue', 'Weakness', 'Pale or yellowish skin', 'Irregular heartbeats', 'Shortness of breath', 'Dizziness or lightheadedness', 
    'Chest pain', 'Cold hands and feet', 'Headache', 'Brittle nails', 'Craving for ice or dirt', 'Poor appetite', 'Sore mouth and tongue', 'Hair loss', 
    'Restless legs syndrome']).
    symptoms('Asthma', ['Shortness of breath', 'Chest tightness', 'Wheezing', 'Coughing', 'Difficulty breathing', 'Rapid breathing', 'Anxiety', 'Fatigue', 
    'Trouble sleeping', 'Chest pain', 'Blue lips or face', 'Frequent respiratory infections', 'Difficulty exercising']).
    symptoms('Shingles', ['Pain', 'Burning', 'Numbness', 'Tingling', 'Sensitivity to touch', 'Red rash', 'Fluid-filled blisters', 'Itching', 'Fever', 
    'Headache', 'Sensitivity to light', 'Fatigue', 'Upset stomach']).
    symptoms('Acid Reflux', ['Heartburn', 'Regurgitation', 'Chest pain', 'Difficulty swallowing', 'Chronic cough', 'Laryngitis', 'New or worsening asthma', 
    'Disrupted sleep', 'Sore throat', 'Bitter taste in mouth', 'Bloating', 'Burping', 'Nausea', 'Hiccups']).
    symptoms('Arthritis', ['Joint pain', 'Stiffness', 'Swelling', 'Redness', 'Decreased range of motion', 'Fatigue', 'Fever', 'Weight loss', 
    'Difficulty moving joints', 'Warmth around the joint', 'Tenderness', 'Muscle weakness', 'Joint deformity', 'Loss of joint function', 'Bone spurs']).
    symptoms('Bronchitis', ['Cough', 'Production of mucus', 'Fatigue', 'Shortness of breath', 'Slight fever and chills', 'Chest discomfort', 'Sore throat']).

% Access Symptom List
