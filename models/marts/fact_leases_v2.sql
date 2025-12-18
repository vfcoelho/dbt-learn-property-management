WITH stg__leases AS (
  SELECT
    *
  FROM {{ ref('stg__leases') }}
), stg__units AS (
  SELECT
    *
  FROM {{ ref('stg__units') }}
), stg__rental_applications AS (
  SELECT
    *
  FROM {{ ref('stg__rental_applications') }}
), rename_2 AS (
  SELECT
    *
    RENAME (ID AS L_ID, CREATED_AT AS L_CREATED_AT, UPLOADED_AT AS L_UPLOADED_AT)
  FROM stg__leases
), rename_5 AS (
  SELECT
    *
    RENAME (ID AS L_ID, CREATED_AT AS L_CREATED_AT, UPLOADED_AT AS L_UPLOADED_AT)
  FROM stg__leases
), rename_3 AS (
  SELECT
    *
    RENAME (ID AS U_ID, CREATED_AT AS U_CREATED_AT, UPLOADED_AT AS U_UPLOADED_AT)
  FROM stg__units
), rename_6 AS (
  SELECT
    *
    RENAME (ID AS U_ID, CREATED_AT AS U_CREATED_AT, UPLOADED_AT AS U_UPLOADED_AT, STATUS AS U_STATUS)
  FROM stg__units
), rename_1 AS (
  SELECT
    *
    RENAME (ID AS RA_ID, CREATED_AT AS RA_CREATED_AT, UPLOADED_AT AS RA_UPLOADED_AT, STATUS AS RA_STATUS)
  FROM stg__rental_applications
), join_1 AS (
  SELECT
    *
  FROM rename_2
  JOIN rename_3
    ON rename_2.UNIT_ID = rename_3.U_ID
), join_2 AS (
  SELECT
    *
  FROM rename_5
  JOIN rename_6
    ON rename_5.UNIT_ID = rename_6.U_ID
), aggregate_1 AS (
  SELECT
    U_ID,
    COUNT(*) AS UNIT_LEASES_COUNT
  FROM join_1
  GROUP BY
    U_ID
), rename_4 AS (
  SELECT
    U_ID AS ULC_ID,
    UNIT_LEASES_COUNT
  FROM aggregate_1
), join_3 AS (
  SELECT
    *
  FROM join_2
  JOIN rename_4
    ON join_2.U_ID = rename_4.ULC_ID
), join_4 AS (
  SELECT
    *
  FROM join_3
  JOIN rename_1
    ON join_3.RENTAL_APPLICATION_ID = rename_1.RA_ID
), formula_1 AS (
  SELECT
    *,
    CAST(START_DATE AS TIMESTAMP) AS START_DATE,
    CAST(END_DATE AS TIMESTAMP) AS END_DATE
  FROM join_4
), rename_7 AS (
  SELECT
    L_ID AS LEASE_ID,
    PROPERTY_ID,
    U_ID AS UNIT_ID,
    RA_ID AS RENTAL_APPLICATION_ID,
    UNIT_LEASES_COUNT,
    START_DATE AS BEGIN_DATE,
    END_DATE,
    COMPLETED,
    RENT
  FROM formula_1
), fact_leases_v2 AS (
  SELECT
    *
  FROM rename_7
)
SELECT
  *
FROM fact_leases_v2