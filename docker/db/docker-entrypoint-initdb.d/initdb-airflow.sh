#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER airflow_user WITH PASSWORD '$AIRFLOW_USER_PASS';
    CREATE DATABASE airflow_db;
    ALTER DATABASE airflow_db OWNER TO airflow_user;
    GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;
    GRANT ALL ON SCHEMA public TO airflow_user;
EOSQL