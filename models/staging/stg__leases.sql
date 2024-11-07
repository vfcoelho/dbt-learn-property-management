select *, true as dummy_column from {{ source("property_management", "leases") }}
--select * from analytics.dbt_vcoelho_prod.stg__leases
