COPY INTO raw.{{ params.table }}
FROM (
    SELECT *,
           {{ params.batch_id }} AS batch_id,
           CURRENT_TIMESTAMP     AS loaded_at,
           METADATA$FILENAME     AS source_file
    FROM @azure_stage/{{ params.path }}/
)
FILE_FORMAT = (FORMAT_NAME = raw.csv_fmt)
PATTERN = '{{ params.pattern }}';