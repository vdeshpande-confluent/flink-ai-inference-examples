INSERT into unclean_data_prediction_result
SELECT 
    patient_id, 
    age, 
    bmi, 
    blood_pressure.systolic AS blood_pressure_systolic, 
    blood_pressure.diastolic AS blood_pressure_diastolic, 
    glucose_level, 
    family_history,
    response AS prediction
FROM unclean_data, 
LATERAL TABLE(
    ML_PREDICT(
        'RecommendationEngine',
        (
            'Analyze the following patient data and predict diabetes risk and its explanation as JSON in the response. 
             If the input data is valid, return the risk factor (low, moderate, high) and a detailed explanation. 
             If the input data is invalid or inconsistent, return "unknown" ' ||
            'Patient ID: ' || CAST(patient_id AS STRING) || ', ' || 
            'Age: ' || CAST(age AS STRING) || ', ' || 
            'BMI: ' || CAST(bmi AS STRING) || ', ' || 
            'Blood Pressure: ' || CAST(blood_pressure.systolic AS STRING) || '/' || CAST(blood_pressure.diastolic AS STRING) || ', ' || 
            'Glucose Level: ' || CAST(glucose_level AS STRING) || ', ' || 
            'Family History: ' ||CAST(family_history AS STRING)  || '.'
        )
    )
);
