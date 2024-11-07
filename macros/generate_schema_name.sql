{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set result_schema = target.schema -%}
    {%- if custom_schema_name is not none -%}

        {%- set result_schema = result_schema ~ "_" ~ custom_schema_name -%}

    {%- endif -%}
    {% if env_var('DBT_MY_ENV') %}
    
        {%- set result_schema = result_schema ~ "_" ~ env_var('DBT_MY_ENV') -%}
        
    {%- endif -%}

    {{ print("Running generate_schema_name: " ~ result_schema) }}
    {{ result_schema | trim }}

{%- endmacro %}