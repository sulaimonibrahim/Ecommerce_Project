FROM apache/airflow:2.8.0-python3.8

RUN apt-get update && apt-get install -y \
    postgresql-client \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Explicitly upgrade psycopg2-binary
RUN pip install --upgrade psycopg2-binary

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY dags /opt/airflow/dags

ENV AIRFLOW_HOME=/opt/airflow



