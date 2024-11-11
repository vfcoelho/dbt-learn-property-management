with

    leases as (select * from {{ ref("stg__leases") }}),
    units as (select * from {{ ref("stg__units") }}),
    rental_applications as (select * from {{ ref("stg__rental_applications") }}),
    unit_lease_count as (
        select u.id, count(*) as unit_leases_count
        from leases l
        inner join units u on l.unit_id = u.id
        group by u.id
    ),

    final as (
        select l.id as lease_id, u.property_id, u.id as unit_id, ra.id as rental_application_id, ulc.unit_leases_count, 'dummy_value' as dummy_column
        from leases l
        inner join units u on l.unit_id = u.id
        inner join unit_lease_count ulc on ulc.id = u.id
        inner join rental_applications ra on ra.id = l.rental_application_id
    )

select *
from final
