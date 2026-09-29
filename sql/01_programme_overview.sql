-- myAkili Kids Impact Dashboard
-- Programme Overview Analysis
-- Dataset: Synthetic portfolio data
-- Author: Kateule Nkole Mwanza

-- 1. Total participants
SELECT COUNT(*) AS total_participants
FROM participants;

-- 2. Total programme sites
SELECT COUNT(*) AS total_sites
FROM schools;

-- 3. Total sessions delivered
SELECT COUNT(*) AS total_sessions
FROM sessions;

-- 4. Attendance summary
SELECT
    attendance_status,
    COUNT(*) AS attendance_records
FROM attendance
GROUP BY attendance_status;

-- 5. Overall attendance rate
SELECT
    ROUND(
        100.0 * SUM(
            CASE WHEN attendance_status = 'Present' THEN 1 ELSE 0 END
        ) / COUNT(*),
        1
    ) AS attendance_rate_percent
FROM attendance;

-- 6. Overall assessment performance
SELECT
    ROUND(AVG(pre_score), 1) AS average_pre_score,
    ROUND(AVG(post_score), 1) AS average_post_score,
    ROUND(AVG(post_score - pre_score), 1) AS average_score_improvement
FROM assessments;
