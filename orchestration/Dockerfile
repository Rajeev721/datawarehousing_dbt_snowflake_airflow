FROM astrocrpublic.azurecr.io/runtime:3.3-8

# dbt lives in its own venv so its dependencies don't clash with Airflow's.
RUN python -m venv /usr/local/airflow/dbt_venv && \
    /usr/local/airflow/dbt_venv/bin/pip install --no-cache-dir dbt-core dbt-snowflake

# Install dbt packages (dbt_utils) at build time.
COPY --chown=astro:0 include/dbt /usr/local/airflow/include/dbt
RUN cd /usr/local/airflow/include/dbt && /usr/local/airflow/dbt_venv/bin/dbt deps
