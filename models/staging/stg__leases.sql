select *, true as dummy_column from {{ source("property_management", "leases") }}
