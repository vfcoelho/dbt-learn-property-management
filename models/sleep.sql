WITH formula_1 AS (
  SELECT
    {{ sleep(1) }} AS SLEPT_TIME
), sleep AS (
  SELECT
    *
  FROM formula_1
)
SELECT
  *
FROM sleep