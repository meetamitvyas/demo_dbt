/* Model : order_details  */
{{
    config(
        materialized = 'incremental'
    )
}}

with

orderDetails as (
    --select * from {{ ref('example_teams') }}
    select * from {{ source("DBT_DB","orders") }}

    {% if is_incremental() %}

        where OrderDate >= (select max(OrderDate) from {{ this }} )

    {% endif %}
),

final as (

    select * from orderDetails
)

select * from final