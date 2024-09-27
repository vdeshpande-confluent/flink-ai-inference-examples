CREATE MODEL RecommendationEngine
INPUT (question STRING)
OUTPUT (response STRING)
WITH (
  'task' = 'text_generation',
  'bedrock.connection' = 'bedrock-cli-connection',
  'provider' = 'bedrock',
  'bedrock.PARAMS.max_tokens' = '20000',
  'bedrock.system_prompt' = 'You are an expert in diabetes diagnostics. Your task is to assist the user with queries or requests related to diabetes risk assessment, patient data analysis based on health indicators.'
);

CREATE TABLE clean_data_prediction_result (
    patient_id INT, 
    age INT, 
    bmi DOUBLE, 
    blood_pressure_systolic INT, 
    blood_pressure_diastolic INT, 
    glucose_level DOUBLE, 
    family_history STRING,
    prediction STRING
);


CREATE TABLE unclean_data_prediction_result (
    patient_id INT, 
    age INT, 
    bmi DOUBLE, 
    blood_pressure_systolic INT, 
    blood_pressure_diastolic INT, 
    glucose_level DOUBLE, 
    family_history STRING,
    prediction STRING
);