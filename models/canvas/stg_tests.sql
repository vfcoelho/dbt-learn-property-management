WITH tests_csv AS (
  SELECT
    *
  FROM {{ source('uploads', 'tests_csv') }}
), stg_tests_sql AS (
  SELECT
    *
  FROM tests_csv
)
SELECT
  *
FROM stg_tests_sql