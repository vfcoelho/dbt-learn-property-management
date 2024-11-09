select * 
from {{ ref('jaffle_shop', 'customers') }}
