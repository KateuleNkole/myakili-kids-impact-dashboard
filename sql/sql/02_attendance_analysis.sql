-- myAkili Kids Impact Dashboard
-- Attendance Analysis
-- Dataset: Synthetic portfolio data
-- Author: Kateule Nkole Mwanza

-- 1. Attendance by status
SELECT
    attendance_status,
    COUNT(*) AS attendance_records
FROM attendance
GROUP BY attendance_status
ORDER BY attendance_records DESC;


-- 2. Attendance rate by programme site
SELECT
    s.school_name,
    COUNT(a.attendance_id) AS total_attendance_records,
    SUM(
        CASE
            WHEN a.attendance_status = 'Present' THEN 1
            ELSE 0
        END
    ) AS present_records,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN a.attendance_status = 'Present' THEN 1
                ELSE 0
            END
        ) / COUNT(a.attendance_id),
        1
    ) AS attendance_rate_percent

FROM attendance a

JOIN participants p
    ON a.participant_id = p.participant_id

JOIN schools s
    ON p.school_id = s.school_id

GROUP BY
    s.school_id,
    s.school_name

ORDER BY
    attendance_rate_percent DESC;


-- 3. Attendance by session topic
SELECT
    se.topic,
    COUNT(a.attendance_id) AS total_attendance_records,

    SUM(
        CASE
            WHEN a.attendance_status = 'Present' THEN 1
            ELSE 0
        END
    ) AS participants_present,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN a.attendance_status = 'Present' THEN 1
                ELSE 0
            END
        ) / COUNT(a.attendance_id),
        1
    ) AS attendance_rate_percent

FROM attendance a

JOIN sessions se
    ON a.session_id = se.session_id

GROUP BY
    se.topic

ORDER BY
    attendance_rate_percent DESC;


-- 4. Participant attendance frequency
SELECT
    participant_id,
    COUNT(*) AS sessions_scheduled,

    SUM(
        CASE
            WHEN attendance_status = 'Present' THEN 1
            ELSE 0
        END
    ) AS sessions_attended

FROM attendance

GROUP BY
    participant_id

ORDER BY
    sessions_attended DESC;
