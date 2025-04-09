WITH input_1 AS (
  SELECT
    *
  FROM {{ ref('property_management', 'dim_properties') }}
), untitled_sql AS (
  SELECT
    *
  FROM input_1
)
SELECT
  *
FROM untitled_sql