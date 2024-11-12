with
    properties as (select * from {{ ref("stg__properties") }}),
    units as (select * from {{ ref("stg__units") }}),
    final as (
        select
            p.id,
            p.name,
            p.address,
            u.address_2,
            p.city,
            p.state,
            p.zip_code,
            p.type,
            p.year_built,
            u.id as unit_id,
            u.rent,
            u.bedrooms,
            u.bathrooms,
            u.square_feet,
            u.status,
            p.created_at,
        from properties p
        inner join units u on u.property_id = p.id
    )
select *
from final
