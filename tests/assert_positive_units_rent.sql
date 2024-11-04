select id, rent from {{ ref("stg__units") }} where rent <= 0
