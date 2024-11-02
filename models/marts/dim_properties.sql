with
    properties as (select * from {{ ref("stg__properties") }}),
    units as ( select * from {{ ref('stg__units') }}),
    final as (
        select * from properties p inner join units u on u.property_id = p.id 
    )
select *
from final
