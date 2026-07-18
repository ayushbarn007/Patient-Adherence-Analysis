# Patient Adherence Analysis (SQL)

A story-driven SQL investigation into what drives medication non-adherence across a 5,000-patient dataset — moving from single-variable analysis to multi-factor risk profiling to anomaly investigation.

## Objective
Identify which patient, socioeconomic, and clinical factors most strongly predict medication non-adherence, and understand *why* certain counter-intuitive patterns exist in the data (e.g., moderate-severity patients showing worse adherence than severe-severity patients).

## Dataset
- **Source table:** `case_studies.patient_adherence_dataset`
- **Scale:** 5,000 patients, 14 columns
- **Fields include:** Age, Gender, Income, Education Level, Insurance Coverage, Social Support Level, Mental Health Status, Condition Severity, Healthcare Access, Medication Type, Dosage, Comorbidities Count, Previous Adherence, Adherence (target)

## Approach
This SQL work covers Phases 1–4 of a broader 6-phase investigation framework (Phases 5–6 — synthesis and final reporting — are documented separately, outside the SQL layer). Run in MySQL Workbench:

**Phase 1 — Individual Column Analysis**
Baseline non-adherence rate, then non-adherence rate broken out across every individual variable (previous adherence, social support, insurance, education, condition severity, mental health, healthcare access, gender, age group, income bracket, medication type, comorbidities, dosage).

**Phase 2 — Combination Analysis**
Two-variable crosstabs (e.g., Previous Adherence × Mental Health Status, Insurance Coverage × Healthcare Access) to test whether risk factors compound each other rather than acting independently.

**Phase 3 — Risk Profile Queries**
Filtered queries isolating a compound high-risk profile (poor previous adherence + low social support + no insurance + poor mental health) against a compound low-risk profile, to quantify the gap between best-case and worst-case patients.

**Phase 4 — Anomaly Investigation**
Follow-up queries explaining three counter-intuitive patterns in the data — e.g., why "Moderate" condition severity showed worse adherence than "Severe," and why "Average" healthcare access showed worse adherence than "Poor" — by checking for confounding variables (social support, insurance) within each group.

## Key Findings
- **Overall non-adherence rate:** 54.28% across 5,000 patients
- **Previous Adherence is the #1 predictor** — patients with no adherence history show a 73.7% non-adherence rate vs. 46.1% for those with prior adherence (a 27.6-point gap, more than double the next-strongest factor)
- **Risk factors compound, not just add.** The strongest single-column gap was 27.6 points (Previous Adherence), but combining Previous Adherence with Social Support widened the gap to 41 points — showing risk factors interact multiplicatively rather than independently
- **Compound risk profiles:** a high-risk patient (no prior adherence + low social support + no insurance + poor/moderate mental health) shows an estimated combined non-adherence rate of ~79–81%, vs. ~37–40% for a low-risk patient — a 41-point spread
- **Social and mental factors outweigh clinical severity.** Social Support (12.7-pt gap) and Mental Health (11.2-pt gap) were stronger predictors than Condition Severity (11.6-pt gap) and Comorbidities Count (6-pt gap)
- **Four data anomalies investigated and explained:** Moderate condition severity, Average healthcare access, Moderate mental health, and High income all showed *worse* adherence than expected — patients in "middle" or seemingly-favorable categories were often under-monitored by both themselves and the healthcare system, while patients with clearly poor status/circumstances received more proactive attention
- **Weak/unreliable predictors flagged:** Medication Type (2-pt gap), Income (4-pt gap), and results in small subgroups (e.g., Gender: "Other" at 73 patients, Dosage: "Low" at 130 patients) were explicitly called out as low-confidence to avoid overstating findings

## Recommendations
- Screen every new patient for prior adherence history — it's the single strongest risk indicator
- Route low-social-support patients into structured support programs
- Prioritize insurance-assistance outreach for uninsured patients
- Flag "moderate" severity/mental-health patients for active monitoring — they're at *higher* risk than "severe" patients due to being under-monitored, not because they're sicker
- Don't assume high income or "average" healthcare access implies low risk — both showed elevated non-adherence in this data

## Limitations
- **Descriptive only, not causal.** This analysis identifies correlations, not causation — a higher non-adherence rate in a group means association, not that the factor causes non-adherence
- **Confounding variables aren't controlled for.** SQL-based group comparisons can't isolate one factor's true independent effect while holding others constant — some anomalies (e.g., Average vs. Poor healthcare access) may be explained by a hidden third variable rather than the factor itself. Logistic regression would be needed to test this properly
- **No formal significance testing.** No p-values, confidence intervals, or chi-square tests were run — all gaps are descriptive differences, not statistically validated
- **Several subgroups are too small to trust:** Gender "Other" (73 patients), Dosage "Low" (130 patients), and the Previous Adherence × Insurance worst-case group (298 patients) are flagged and excluded from strong conclusions
- **Single-source dataset** — 5,000 patients from one dataset; findings may not generalize to other patient populations or healthcare systems

## Tools
SQL (MySQL Workbench)

## File Structure
```
Patient-Adherence-Analysis/
├── README.md
└── sql/
    └── patient_adherence_analysis.sql
```
