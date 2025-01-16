:- use_module(library(scasp)).

% Define facts about common household drugs
drug(paracetamol).
drug(ibuprofen).
drug(antihistamine).
drug(cough_syrup).
drug(aspirin).
drug(menthol_cream).
drug(nasal_spray).
drug(baking_soda).
drug(honey).
drug(ginger).
drug(chamomile_tea).
drug(aloe_vera).
drug(apple_cider_vinegar).
drug(vapor_rub).
drug(clove_oil).
drug(witch_hazel).
drug(oatmeal_bath).

drug_property(paracetamol, 
[pain_relief, fever_reduction]).
drug_property(ibuprofen, [pain_relief, anti_inflammatory]).
drug_property(antihistamine, [allergy_relief, sedative]).
drug_property(cough_syrup, [cough_suppression]).
drug_property(aspirin, [pain_relief, anti_inflammatory, blood_thinner]).
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

% Define facts about illnesses and their symptoms
illness(migraine, [severe_headache, nausea, vomiting, sensitivity_to_light, sensitivity_to_sound, blurred_vision, lightheadedness, fainting, aura, throbbing_pain, pulsating_pain, pain_on_one_side_of_head, neck_stiffness, fatigue, difficulty_concentrating]).
illness(common_cold, [cough, fever, pain, congestion]).
illness(allergic_reaction, [itching, swelling, sneezing]).
illness(arthritis, [joint_pain, stiffness, swelling, redness, decreased_range_of_motion, fatigue, fever, weight_loss, difficulty_moving_joints, warmth_around_joint, tenderness, muscle_weakness, joint_deformity, loss_of_joint_function, bone_spurs]).
illness(heartburn, [acid_reflux, pain]).
illness(muscle_ache, [pain, stiffness]).
illness(nasal_congestion, [congestion]).
illness(sore_throat, [pain, cough]).
illness(minor_wound, [inflammation, infection]).
illness(insect_bite, [itching, swelling]).
illness(bruises, [pain, inflammation]).
illness(fever, [fever, pain, headache, sweating, chills, shivering, muscle_aches, loss_of_appetite, dehydration, weakness]).
illness(cuts, [infection, inflammation]).
illness(sunburn, [pain, itching, inflammation]).
illness(cough, [cough]).
illness(period_cramps, [pain_in_lower_abdomen, pain_in_lower_back, pain_in_thighs, nausea, vomiting, diarrhea, fatigue, weakness, headache, dizziness, sweating, fainting, loose_stools, constipation, bloating, breast_tenderness, acne, mood_swings, irritability, depression, anxiety, trouble_sleeping, appetite_changes, food_cravings, weight_gain, joint_or_muscle_pain, fever, chills]).
illness(diabetes, [increased_thirst, frequent_urination, extreme_hunger, unexplained_weight_loss, presence_of_ketones_in_urine, fatigue, irritability, blurred_vision, slow_healing_sores, frequent_infections, areas_of_darkened_skin]).
illness(hypertension, [headache, shortness_of_breath, nosebleeds, flushing, dizziness, chest_pain, visual_changes, blood_in_urine, fatigue, confusion, irregular_heartbeat, pounding_in_chest_neck_or_ears]).
illness(anemia, [fatigue, weakness, pale_or_yellowish_skin, irregular_heartbeats, shortness_of_breath, dizziness_or_lightheadedness, chest_pain, cold_hands_and_feet, headache, brittle_nails, craving_for_ice_or_dirt, poor_appetite, sore_mouth_and_tongue, hair_loss, restless_legs_syndrome]).
illness(asthma, [shortness_of_breath, chest_tightness, wheezing, coughing, difficulty_breathing, rapid_breathing, anxiety, fatigue, trouble_sleeping, chest_pain, blue_lips_or_face, frequent_respiratory_infections, difficulty_exercising]).
illness(shingles, [pain, burning, numbness, tingling, sensitivity_to_touch, red_rash, fluid_filled_blisters, itching, fever, headache, sensitivity_to_light, fatigue, upset_stomach]).
illness(acid_reflux, [heartburn, regurgitation, chest_pain, difficulty_swallowing, chronic_cough, laryngitis, new_or_worsening_asthma, disrupted_sleep, sore_throat, bitter_taste_in_mouth, bloating, burping, nausea, hiccups]).
illness(bronchitis, [cough, production_of_mucus, fatigue, shortness_of_breath, slight_fever_and_chills, chest_discomfort, sore_throat]).
illness(eczema, [dry_skin, itching, redness, inflammation]).
illness(cold_sores, [blisters, itching, burning]).
illness(constipation, [difficulty_in_bowel_movement, bloating]).
illness(nausea, [stomach_discomfort, vomiting]).
illness(hives, [itchy_skin, raised_welts]).
illness(toothache, [pain_in_teeth, jaw_pain]).
illness(psoriasis, [scaly_patches, redness, itching]).
illness(indigestion, [bloating, discomfort_in_stomach]).
illness(hemorrhoids, [pain_around_anus, itching, swelling]).
illness(chapped_lips, [dry_lips, cracked_lips]).

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

test(aspirin_for_heartburn, [fail]) :-
    can_treat(aspirin, heartburn).

test(honey_for_sore_throat) :-
    can_treat(honey, sore_throat).

test(nasal_spray_for_congestion) :-
    can_treat(nasal_spray, nasal_congestion).

test(baking_soda_for_insect_bite) :-
    can_treat(baking_soda, insect_bite).

test(ginger_for_period_cramps) :-
    can_treat(ginger, period_cramps).

test(chamomile_tea_for_insomnia) :-
    can_treat(chamomile_tea, trouble_sleeping).

test(aloe_vera_for_sunburn) :-
    can_treat(aloe_vera, sunburn).

test(apple_cider_vinegar_for_heartburn) :-
    can_treat(apple_cider_vinegar, heartburn).

test(vapor_rub_for_cough) :-
    can_treat(vapor_rub, cough).

test(clove_oil_for_toothache) :-
    can_treat(clove_oil, toothache).

test(witch_hazel_for_hemorrhoids) :-
    can_treat(witch_hazel, hemorrhoids).

test(oatmeal_bath_for_eczema) :-
    can_treat(oatmeal_bath, eczema).

:- end_tests(drug_repurposing).

% Query to identify potential repurposing options
?- can_treat(Drug, Illness).
