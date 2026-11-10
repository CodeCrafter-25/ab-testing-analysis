
CREATE OR REPLACE TABLE
  `bright-gearbox-402817.ab_testing.tableau_retention_metrics`
AS

WITH retention_data AS (
    SELECT
        version,
        COUNT(*) AS total_users,
        COUNTIF(retention_1 = TRUE) AS retained_d1,
        COUNTIF(retention_7 = TRUE) AS retained_d7,
        ROUND(AVG(sum_gamerounds), 2) AS avg_game_rounds
    FROM `bright-gearbox-402817.ab_testing.cookie_cats_raw`
    GROUP BY version
)

SELECT
    version,
    'Retention D1' AS metric,
    total_users,
    retained_d1 AS retained_users,
    SAFE_DIVIDE(retained_d1, total_users) AS retention_rate,
    avg_game_rounds
FROM retention_data

UNION ALL

SELECT
    version,
    'Retention D7' AS metric,
    total_users,
    retained_d7 AS retained_users,
    SAFE_DIVIDE(retained_d7, total_users) AS retention_rate,
    avg_game_rounds
FROM retention_data;
