/* Snapshot : products_snapshot  */
{% snapshot products_snapshot %}

{{
    config(
      target_database='DBT_DB',
      target_schema='DBT_SCHEMA',
      unique_key='ProductID',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ source("DBT_DB", 'Products') }}

{% endsnapshot %}