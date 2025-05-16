WITH stg__properties AS (
  /* Staged properties data from our property management warehouse. */
  SELECT
    *
  FROM {{ ref('property_management', 'stg__properties') }}
), stg__units AS (
  /* Staged units data from our property management warehouse. */
  SELECT
    *
  FROM {{ ref('property_management', 'stg__units') }}
), join_1 AS (
  SELECT
    *
  FROM stg__units
  JOIN stg__properties
    ON stg__units.PROPERTY_ID = stg__properties.ID
), aggregate_1 AS (
  SELECT
    STATUS,
    COUNT(STATUS) AS count_STATUS
  FROM join_1
  GROUP BY
    STATUS
), filter_1 AS (
  SELECT
    *
  FROM aggregate_1
  WHERE
    STATUS IN ('vacant', 'rented')
), rename_1 AS (
  SELECT
    *
    RENAME (STATUS AS situation, count_STATUS AS amount)
  FROM filter_1
), untitled_sql AS (
  SELECT
    *
  FROM rename_1
)
SELECT
  *
FROM untitled_sql