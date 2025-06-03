WITH stg__properties AS (
  SELECT
    *
  FROM {{ ref('stg__properties') }}
), stg__units AS (
  SELECT
    *
  FROM {{ ref('stg__units') }}
), join_05c8 AS (
  SELECT
    stg__units.ID AS UNIT_ID,
    stg__properties.ID,
    stg__properties.NAME,
    stg__properties.ADDRESS,
    stg__units.ADDRESS_2,
    stg__properties.CITY,
    stg__properties.STATE,
    stg__properties.ZIP_CODE,
    stg__properties.TYPE,
    stg__properties.YEAR_BUILT,
    stg__units.RENT,
    stg__units.BEDROOMS,
    stg__units.BATHROOMS,
    stg__units.SQUARE_FEET,
    stg__units.STATUS,
    stg__properties.CREATED_AT
  FROM stg__properties
  JOIN stg__units
    ON stg__properties.ID = stg__units.PROPERTY_ID
), dim_properties AS (
  SELECT
    *
  FROM join_05c8
)
SELECT
  *
FROM dim_properties