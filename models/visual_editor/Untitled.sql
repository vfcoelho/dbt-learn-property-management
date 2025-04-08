WITH input_1 AS (
  SELECT
    *
  FROM {{ ref('property_management', 'dim_properties') }}
), input_2 AS (
  SELECT
    *
  FROM {{ ref('property_management', 'fact_leases', v=2) }}
), rename_1 AS (
  SELECT
    *
    RENAME (ID AS PROPERTY_ID)
  FROM input_1
), rename_2 AS (
  SELECT
    *
    RENAME (LEASE_ID AS LEASE)
  FROM input_2
), join_1 AS (
  SELECT
    *
  FROM rename_1
  JOIN rename_2
    ON rename_1.PROPERTY_ID = rename_2.PROPERTY_ID
), untitled_sql AS (
  SELECT
    *
  FROM join_1
)
SELECT
  *
FROM untitled_sql