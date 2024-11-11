select * 
from {{ ref('fact_leases', v=1) }}
