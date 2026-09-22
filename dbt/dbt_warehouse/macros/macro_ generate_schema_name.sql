{% macro generate_schema_name(custom_schema, node)%}
    {%- set default_schema = target.schema -%}
    {%- if custom_schema is not none -%}
        {{ custom_schema | trim}}
    {%- else -%}
        {{ default_schema }}
    {%- endif -%}
{% endmacro %}