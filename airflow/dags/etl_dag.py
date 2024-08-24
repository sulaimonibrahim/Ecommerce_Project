from datetime import timedelta, datetime
from airflow import DAG
from airflow.providers.google.cloud.transfers.postgres_to_gcs import PostgresToGCSOperator
from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator
from airflow.providers.google.cloud.operators.bigquery import BigQueryCheckOperator

# Define the default arguments for the DAG
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 8, 18),  
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Create a DAG instance
dag = DAG(
    'postgres_to_bigquery',
    default_args=default_args,
    description='Extract data from PostgreSQL and load into BigQuery',
    schedule=None,  
    catchup=False
)

# BigQuery config variables
BQ_CONN_ID = "google_cloud_default" 
BQ_PROJECT = "capstone-project-431210"  
BQ_DATASET = "ecomm" 
BQ_BUCKET = 'e-commerce_bucket'  

# Postgres config variables
PG_CONN_ID = "my_postgres_conn"  
PG_SCHEMA = "public" 
tables = [
    {'table_name': 'product_cat_name_trans', 'gcs_path': 'data/product_cat_name_trans.json'},
    {'table_name': 'olist_sellers_dataset', 'gcs_path': 'data/olist_sellers_dataset.json'},
    {'table_name': 'olist_products_dataset', 'gcs_path': 'data/olist_products_dataset.json'},
    {'table_name': 'olist_orders_dataset', 'gcs_path': 'data/olist_orders_dataset.json'},
    {'table_name': 'olist_order_reviews_dataset', 'gcs_path': 'data/olist_order_reviews_dataset.json'},
    {'table_name': 'olist_order_payments_dataset', 'gcs_path': 'data/olist_order_payments_dataset.json'},
    {'table_name': 'olist_order_items_dataset', 'gcs_path': 'data/olist_order_items_dataset.json'},
    {'table_name': 'olist_geolocation_dataset', 'gcs_path': 'data/olist_geolocation_dataset.json'},
    {'table_name': 'olist_customers_dataset', 'gcs_path': 'data/olist_customers_dataset.json'}
]

# Tasks to transfer data from PostgreSQL to GCS
extract_tasks = []
load_tasks = []

for table in tables:
    extract_task = PostgresToGCSOperator(
        task_id=f'extract_{table["table_name"]}_to_gcs',
        sql=f'SELECT * FROM {PG_SCHEMA}.{table["table_name"]};',
        bucket=BQ_BUCKET,
        filename=table['gcs_path'],
        export_format='NEWLINE_DELIMITED_JSON',  
        gzip=False,
        postgres_conn_id=PG_CONN_ID,
        field_delimiter=',',
        max_active_tis_per_dag=1,
        gcp_conn_id=BQ_CONN_ID,
        dag=dag
    )

    load_task = GCSToBigQueryOperator(
        task_id=f'load_{table["table_name"]}_to_bigquery',
        bucket=BQ_BUCKET,
        source_objects=[table['gcs_path']],
        destination_project_dataset_table=f'{BQ_PROJECT}.{BQ_DATASET}.{table["table_name"]}',
        source_format='NEWLINE_DELIMITED_JSON',
        create_disposition='CREATE_IF_NEEDED',
        write_disposition='WRITE_TRUNCATE',
        autodetect=True,
        gcp_conn_id=BQ_CONN_ID,
        dag=dag
    )

    extract_tasks.append(extract_task)
    load_tasks.append(load_task)

    # Chain all extract tasks to run before the corresponding load task
    if extract_tasks:
        extract_tasks[-1] >> load_tasks

# Optional: Add BigQueryCheckOperator tasks for verification
for table in tables:
    check_task = BigQueryCheckOperator(
        task_id=f'check_{table["table_name"]}_in_bigquery',
        sql=f"SELECT COUNT(*) FROM `{BQ_PROJECT}.{BQ_DATASET}.{table['table_name']}`;",
        use_legacy_sql=False,
        gcp_conn_id=BQ_CONN_ID,
        dag=dag
    )
    load_tasks[-1] >> check_task
