# Patient Adherence Analysis (SQL)

A story-driven SQL investigation into what drives medication non-adherence across a 5,000-patient dataset — moving from single-variable analysis to multi-factor risk profiling to anomaly investigation.

## Objective
Identify which patient, socioeconomic, and clinical factors most strongly predict medication non-adherence, and understand *why* certain counter-intuitive patterns exist in the data (e.g., moderate-severity patients showing worse adherence than severe-severity patients).

## Dataset
- **Source table:** `case_studies.patient_adherence_dataset`
- **Scale:** 5,000 patients, 14 columns
- **Fields include:** Age, Gender, Income, Education Level, Insurance Coverage, Social Support Level, Mental Health Status, Condition Severity, Healthcare Access, Medication Type, Dosage, Comorbidities Count, Previous Adherence, Adherence (target)

## Approach
The analysis is structured in four phases, run in MySQL Workbench:

**Phase 1 — Individual Column Analysis**
Baseline non-adherence rate, then non-adherence rate broken out across every individual variable (previous adherence, social support, insurance, education, condition severity, mental health, healthcare access, gender, age group, income bracket, medication type, comorbidities, dosage).

**Phase 2 — Combination Analysis**
Two-variable crosstabs (e.g., Previous Adherence × Mental Health Status, Insurance Coverage × Healthcare Access) to test whether risk factors compound each other rather than acting independently.

**Phase 3 — Risk Profile Queries**
Filtered queries isolating a compound high-risk profile (poor previous adherence + low social support + no insurance + poor mental health) against a compound low-risk profile, to quantify the gap between best-case and worst-case patients.

**Phase 4 — Anomaly Investigation**
Follow-up queries explaining three counter-intuitive patterns in the data — e.g., why "Moderate" condition severity showed worse adherence than "Severe," and why "Average" healthcare access showed worse adherence than "Poor" — by checking for confounding variables (social support, insurance) within each group.

## Key Findings
*(Add your specific figures here, e.g.:)*
- Overall non-adherence rate: **X%**
- Previous Adherence was the single strongest predictor of future adherence
- Compound high-risk patients (poor previous adherence + low support + no insurance + poor mental health) showed a non-adherence rate of **X%**, vs. **X%** for the compound low-risk group
- Anomalies in Phase 4 were explained by [confounding variable], not by the primary variable itself — suggesting adherence risk factors interact multiplicatively rather than independently

## Tools
SQL (MySQL Workbench)

## File Structure
```
Patient-Adherence-Analysis/
├── README.md
└── sql/
    └── patient_adherence_analysis.sql
```
