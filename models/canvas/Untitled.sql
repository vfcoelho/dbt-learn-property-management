WITH dim_properties AS (
  SELECT
    *
  FROM {{ ref('property_management', 'dim_properties') }}
), untitled_sql AS (
  SELECT
    *
  FROM dim_properties
)
SELECT
  *
FROM untitled_sql