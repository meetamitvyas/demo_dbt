/* Snapshot : order_snapshot  */
{% snapshot orders_snapshot %}

{{
    config(
      target_database='DBT_DB',
      target_schema='DBT_SCHEMA',
      unique_key='OrderID',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ source('DBT_DB', 'orders') }}

{% endsnapshot %}