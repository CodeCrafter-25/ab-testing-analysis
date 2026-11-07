
-- Project #6: Cookie Cats A/B Testing
-- Tool: Google BigQuery

-- 1. Dataset Overview
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT userid) AS unique_users,
    COUNTIF(version = 'gate_30') AS control_users,
    COUNTIF(version = 'gate_40') AS treatment_users
FROM `bright-gearbox-402817.ab_testing.cookie_cats_raw`;


-- 2. Data Quality Checks
SELECT
    COUNTIF(userid IS NULL) AS missing_userid,
    COUNTIF(version IS NULL) AS missing_version,
    COUNTIF(sum_gamerounds IS NULL) AS missing_gamerounds,
    COUNTIF(retention_1 IS NULL) AS missing_retention_1,
    COUNTIF(retention_7 IS NULL) AS missing_retention_7,
    COUNTIF(
        version NOT IN ('gate_30', 'gate_40')
    ) AS invalid_versions,
    COUNTIF(sum_gamerounds < 0) AS negative_gamerounds
FROM `bright-gearbox-402817.ab_testing.cookie_cats_raw`;


-- 3. Retention Analysis by Experiment Group
SELECT
    version,
    COUNT(*) AS total_users,

    COUNTIF(retention_1 = TRUE) AS retained_d1,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(retention_1 = TRUE),
            COUNT(*)
        ) * 100, 2
    ) AS retention_d1_pct,

    COUNTIF(retention_7 = TRUE) AS retained_d7,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(retention_7 = TRUE),
            COUNT(*)
        ) * 100, 2
    ) AS retention_d7_pct,

    ROUND(AVG(sum_gamerounds), 2) AS avg_game_rounds

FROM `bright-gearbox-402817.ab_testing.cookie_cats_raw`
GROUP BY version
ORDER BY version;
