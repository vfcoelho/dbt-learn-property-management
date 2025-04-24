WITH input_1 AS (
  SELECT
    *
  FROM {{ ref('property_management', 'dim_properties') }}
), canvas_test_sql AS (
  SELECT
    *
  FROM input_1
)
SELECT
  *
FROM canvas_test_sql