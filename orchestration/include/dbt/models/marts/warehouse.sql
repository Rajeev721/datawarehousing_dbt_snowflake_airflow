{{
	config(
		incremental_strategy = 'append',
		full_refresh = var('allow_full_refresh', false)
	)
}}
{{ raw_incremental('WAREHOUSE') }}
