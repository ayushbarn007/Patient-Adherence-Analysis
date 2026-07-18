-- ============================================================
-- PATIENT ADHERENCE ANALYSIS
-- Database: case_studies.patient_adherence_dataset
-- Complete Query File - All Phases
-- ============================================================

USE case_studies;

-- ============================================================
-- PHASE 1 - INDIVIDUAL COLUMN ANALYSIS
-- ============================================================

-- 1. Overall Non-Adherence Rate
SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS overall_non_adhere_pct
FROM case_studies.patient_adherence_dataset;

-- 2. Previous Adherence Analysis
SELECT 
    Previous_Adherence,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adhere_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence;

-- 3. Social Support Level Analysis
SELECT 
    Social_Support_Level,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS social_support_analysis_adherence
FROM case_studies.patient_adherence_dataset
GROUP BY Social_Support_Level;

-- 4. Insurance Coverage Analysis
SELECT 
    Insurance_Coverage,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS current_non_adherence
FROM case_studies.patient_adherence_dataset
GROUP BY Insurance_Coverage;

-- 5. Education Level Analysis
SELECT 
    Education_Level,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS social_support_analysis_adherence
FROM case_studies.patient_adherence_dataset
GROUP BY Education_Level
ORDER BY 4;

-- 6. Condition Severity Analysis
SELECT 
    Condition_Severity,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS condition_severity_analysis
FROM case_studies.patient_adherence_dataset
GROUP BY Condition_Severity
ORDER BY 1;

-- 7. Mental Health Status Analysis
SELECT 
    Mental_Health_Status,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS mental_health_adherence_analysis
FROM case_studies.patient_adherence_dataset
GROUP BY Mental_Health_Status;

-- 8. Healthcare Access Analysis
SELECT 
    Healthcare_Access,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS healthcare_case_access_adherence_analysis
FROM case_studies.patient_adherence_dataset
GROUP BY Healthcare_Access;

-- 9. Gender Analysis
SELECT 
    Gender,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adhere_patients_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Gender;

-- 10. Age Group Analysis
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN 'Youth: 18-24 years'
        WHEN Age BETWEEN 25 AND 44 THEN 'Young Adults: 25-44 years'
        WHEN Age BETWEEN 45 AND 59 THEN 'Middle Age: 45-59 years'
        WHEN Age BETWEEN 60 AND 74 THEN 'Elderly: 60-74 years'
        ELSE 'Aged: 75+ years'
    END AS Age_categories,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adhere_patient_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Age_categories;

-- 11. Income Classification Analysis
SELECT 
    CASE 
        WHEN Income BETWEEN 100000 AND 400000 THEN 'Low_Income'
        WHEN Income BETWEEN 400001 AND 800000 THEN 'Average_Income'
        ELSE 'High_Income'
    END AS Income_classification,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Income_Classification;

-- 12. Medication Type Analysis
SELECT 
    Medication_Type,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adhere_patient_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Medication_Type;

-- 13. Comorbidities Count Analysis
SELECT 
    Comorbidities_Count,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS comorbidities_adherence_analysis
FROM case_studies.patient_adherence_dataset
GROUP BY Comorbidities_Count;

-- 14. Dosage Classification Analysis
SELECT 
    CASE 
        WHEN Dosage_mg BETWEEN 50 AND 100 THEN 'Low_Dose'
        WHEN Dosage_mg BETWEEN 101 AND 200 THEN 'Medium_Dose'
        ELSE 'High_Dose'
    END AS Dosage_classification,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Dosage_classification;

-- ============================================================
-- PHASE 2 - COMBINATION ANALYSIS
-- ============================================================

-- 1. Previous Adherence x Mental Health Status
SELECT 
    Previous_Adherence,
    Mental_Health_Status,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence, Mental_Health_Status
ORDER BY non_adh_pct DESC;

-- 2. Previous Adherence x Social Support Level
SELECT 
    Previous_Adherence,
    Social_Support_Level,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence, Social_Support_Level
ORDER BY non_adh_pct DESC;

-- 3. Previous Adherence x Insurance Coverage
SELECT 
    Previous_Adherence,
    Insurance_Coverage,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence, Insurance_Coverage
ORDER BY non_adh_pct DESC;

-- 4. Previous Adherence x Education Level
SELECT 
    Previous_Adherence,
    Education_Level,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence, Education_Level
ORDER BY non_adh_pct DESC;

-- 5. Previous Adherence x Condition Severity
SELECT 
    Previous_Adherence,
    Condition_Severity,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS ic_ha_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS ic_ha_non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Previous_Adherence, Condition_Severity
ORDER BY non_adh_pct DESC;

-- 6. Mental Health Status x Social Support Level
SELECT 
    Mental_Health_Status,
    Social_Support_Level,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS ic_ha_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS ic_ha_non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Mental_Health_Status, Social_Support_Level
ORDER BY non_adh_pct DESC;

-- 7. Insurance Coverage x Healthcare Access
SELECT 
    Insurance_Coverage,
    Healthcare_Access,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS TRUE THEN 1 ELSE 0 END) AS adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adh,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Insurance_Coverage, Healthcare_Access
ORDER BY non_adh_pct DESC;

-- ============================================================
-- PHASE 3 - RISK PROFILE QUERIES
-- ============================================================

-- High Risk Patient Profile Query (Top 4 filters)
SELECT 
    Previous_Adherence,
    Social_Support_Level,
    Insurance_Coverage,
    Mental_Health_Status,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
WHERE 
    Previous_Adherence IS FALSE AND
    Social_Support_Level = 'Low' AND
    Insurance_Coverage IS FALSE AND
    Mental_Health_Status = 'Poor'
GROUP BY 
    Previous_Adherence,
    Social_Support_Level,
    Insurance_Coverage,
    Mental_Health_Status;

-- Low Risk Patient Profile Query
SELECT 
    Previous_Adherence,
    Social_Support_Level,
    Insurance_Coverage,
    Mental_Health_Status,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END) AS non_adhere_patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
WHERE 
    Previous_Adherence IS TRUE AND
    Social_Support_Level = 'High' AND
    Insurance_Coverage IS TRUE AND
    Mental_Health_Status = 'Good'
GROUP BY 
    Previous_Adherence,
    Social_Support_Level,
    Insurance_Coverage,
    Mental_Health_Status;

-- ============================================================
-- PHASE 4 - ANOMALY INVESTIGATION QUERIES
-- ============================================================

-- Anomaly 1: Condition Severity - Why Moderate worse than Severe?
-- Check Social Support distribution within Condition Severity groups
SELECT 
    Condition_Severity,
    Social_Support_Level,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Condition_Severity, Social_Support_Level
ORDER BY Condition_Severity, non_adh_pct DESC;

-- Anomaly 2: Healthcare Access - Why Average worse than Poor?
-- Check Insurance distribution within Healthcare Access groups
SELECT 
    Healthcare_Access,
    Insurance_Coverage,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Healthcare_Access, Insurance_Coverage
ORDER BY Healthcare_Access, non_adh_pct DESC;

-- Anomaly 3: Mental Health - Why Moderate worse than Poor?
-- Check Social Support distribution within Mental Health groups
SELECT 
    Mental_Health_Status,
    Social_Support_Level,
    COUNT(*) AS patients,
    SUM(CASE WHEN Adherence IS FALSE THEN 1 ELSE 0 END)*100/COUNT(*) AS non_adh_pct
FROM case_studies.patient_adherence_dataset
GROUP BY Mental_Health_Status, Social_Support_Level
ORDER BY Mental_Health_Status, non_adh_pct DESC;

-- ============================================================
-- END OF QUERY FILE
-- ============================================================
