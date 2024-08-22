with source_orders as (
    select * from {{ source("dbt_db", "orders") }}
),

final as (
    select * from source_orders
)

select * from final