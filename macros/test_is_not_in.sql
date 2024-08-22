/* test name : test_is_not_in  */
{% macro test_is_not_in(model, column_name) -%}

with validation as (

    select
        {{ column_name }} as item
        --,name
    from {{ model }}

),

validation_errors as (

    select
        item

    from validation

    WHERE item NOT IN  ( SELECT  item FROM ItemMaster )

)
--select *
select count(*)
from validation_errors

{% endmacro %}