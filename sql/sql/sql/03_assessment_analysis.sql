-- myAkili Kids Impact Dashboard
-- Financial Literacy Assessment Analysis
-- Dataset: Synthetic portfolio data
-- Author: Kateule Nkole Mwanza


-- 1. Overall pre- and post-assessment performance
SELECT
    ROUND(AVG(pre_score), 1) AS average_pre_score,
    ROUND(AVG(post_score), 1) AS average_post_score,
    ROUND(AVG(post_score - pre_score), 1) AS average_score_improvement
FROM assessments;


-- 2. Number and percentage of participants who improved
SELECT
    COUNT(*) AS total_participants,

    SUM(
        CASE
            WHEN post_score > pre_score THEN 1
            ELSE 0
        END
    ) AS participants_improved,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN post_score > pre_score THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        1
    ) AS improvement_rate_percent

FROM assessments;


-- 3. Assessment performance by programme site
SELECT
    s.school_name,

    COUNT(a.participant_id) AS participants_assessed,

    ROUND(AVG(a.pre_score), 1) AS average_pre_score,

    ROUND(AVG(a.post_score), 1) AS average_post_score,

    ROUND(
        AVG(a.post_score - a.pre_score),
        1
    ) AS average_score_improvement

FROM assessments a

JOIN participants p
    ON a.participant_id = p.participant_id

JOIN schools s
    ON p.school_id = s.school_id

GROUP BY
    s.school_id,
    s.school_name

ORDER BY
    average_score_improvement DESC;


-- 4. Assessment improvement by age group
SELECT
    p.age_group,

    COUNT(a.participant_id) AS participants_assessed,

    ROUND(AVG(a.pre_score), 1) AS average_pre_score,

    ROUND(AVG(a.post_score), 1) AS average_post_score,

    ROUND(
        AVG(a.post_score - a.pre_score),
        1
    ) AS average_score_improvement

FROM assessments a

JOIN participants p
    ON a.participant_id = p.participant_id

GROUP BY
    p.age_group

ORDER BY
    average_score_improvement DESC;


-- 5. Individual improvement distribution
SELECT
    participant_id,
    pre_score,
    post_score,
    post_score - pre_score AS score_change,

    CASE
        WHEN post_score - pre_score >= 20 THEN 'High improvement'
        WHEN post_score - pre_score >= 10 THEN 'Moderate improvement'
        WHEN post_score > pre_score THEN 'Some improvement'
        WHEN post_score = pre_score THEN 'No change'
        ELSE 'Decline'
    END AS improvement_category

FROM assessments

ORDER BY
    score_change DESC;
