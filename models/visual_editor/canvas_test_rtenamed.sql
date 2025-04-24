WITH dim_properties AS (
  SELECT
    *
  FROM {{ ref('property_management', 'dim_properties') }}
), canvas_test_rtenamed_sql AS (
  SELECT
    ID,
    NAME,
    ADDRESS,
    ADDRESS_2,
    STATE
  FROM dim_properties
)
SELECT
  *
FROM canvas_test_rtenamed_sql