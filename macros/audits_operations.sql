{% macro insert_audits(action_name) -%}

    Insert into dbt_db.dbt_schema.dbt_audits (audit_type) 
    values ('{{ action_name }}');
    commit;

{% endmacro %}