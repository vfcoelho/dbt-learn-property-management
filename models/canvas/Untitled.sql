WITH stg__leases AS (
  /* Staged leases data from our property management warehouse. */
  SELECT
    *
  FROM {{ ref('property_management', 'stg__leases') }}
), untitled_sql AS (
  SELECT
    *
  FROM stg__leases
)
SELECT
  *
FROM untitled_sql