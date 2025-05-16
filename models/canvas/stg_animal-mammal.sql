WITH animal_mammal_csv AS (
  SELECT
    *
  FROM {{ source('uploads', 'animal_mammal_csv') }}
), stg_animal_mammal_sql AS (
  SELECT
    *
  FROM animal_mammal_csv
)
SELECT
  *
FROM stg_animal_mammal_sql