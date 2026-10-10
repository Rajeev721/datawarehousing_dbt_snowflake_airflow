{#
    Raw layer pattern.
    First run (table missing) : full load from the TPCDS sample data.
    Later runs                : only new rows from RAW_FILE_LOAD, filtered on LOADED_AT.
    dbt's append inserts by column name, so column order does not matter.
#}
{% macro mart_incremental(table_name) %}
{% if is_incremental() %}
	SELECT
		*
	FROM {{ source('RAW_FILE_LOAD', table_name) }}
	WHERE LOADED_AT > (SELECT COALESCE(MAX(LOADED_AT), '1900-01-01'::TIMESTAMP) FROM {{ this }})
{% else %}
	SELECT
		*,
		CURRENT_TIMESTAMP() AS LOADED_AT
	FROM {{ source('TPCDS_SF100TCL', table_name) }}
{% endif %}
{% endmacro %}
