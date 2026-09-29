# KPI Definitions

This document defines the key performance indicators used in the
myAkili Kids Impact Dashboard.

> **Data note:** All analytical results in this portfolio project are
> based on simulated data and should not be interpreted as actual
> myAkili Kids programme outcomes.

## 1. Programme Reach

**Definition:** Number of unique participants represented in the programme dataset.

**Calculation:** Count of unique Participant_ID values.

**Business purpose:** Measures the scale of programme participation.

---

## 2. Sites Reached

**Definition:** Number of programme sites represented in the dataset.

**Calculation:** Count of unique School_ID values.

**Business purpose:** Shows the geographical/programme footprint included in the analysis.

---

## 3. Sessions Delivered

**Definition:** Total number of financial literacy sessions recorded.

**Calculation:** Count of unique Session_ID values.

**Business purpose:** Measures programme delivery activity.

---

## 4. Attendance Rate

**Definition:** Percentage of scheduled participant-session records marked as Present.

**Calculation:**

Attendance Rate = Present Attendance Records / Total Attendance Records × 100

**Business purpose:** Measures participant engagement with programme sessions.

---

## 5. Average Pre-Assessment Score

**Definition:** Average financial literacy score before programme participation.

**Calculation:** Average of Pre_Score.

**Business purpose:** Establishes the simulated baseline level of financial literacy.

---

## 6. Average Post-Assessment Score

**Definition:** Average financial literacy score after programme participation.

**Calculation:** Average of Post_Score.

**Business purpose:** Measures simulated financial literacy performance following participation.

---

## 7. Average Score Improvement

**Definition:** Average change between post- and pre-assessment scores.

**Calculation:**

Average Score Improvement = Average(Post_Score - Pre_Score)

**Business purpose:** Indicates the direction and magnitude of simulated learning outcomes.

---

## 8. Participant Improvement Rate

**Definition:** Percentage of assessed participants whose post-assessment score is higher than their pre-assessment score.

**Calculation:**

Improvement Rate = Participants with Post_Score > Pre_Score / Total Participants Assessed × 100

**Business purpose:** Shows how consistently simulated learning improvement occurs across participants.

---

## Planned Dashboard Views

The Power BI dashboard will include:

- Executive programme overview
- Programme reach by site
- Attendance rate by site
- Pre- vs post-assessment comparison
- Average score improvement by site
- Performance by age group
- Session/topic engagement
- Filters for site, age group and gender
