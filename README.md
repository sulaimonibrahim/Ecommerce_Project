E-Commerce Data Pipeline Project

Overview

This project involves building a data pipeline for analyzing an e-commerce dataset. The pipeline includes PostgreSQL scripts for data ingestion, an Airflow DAG for orchestrating ETL processes, dbt models for data transformation, and analysis to answer key business questions. The entire setup is containerized using Docker.

Project Structure
PostgreSQL Scripts: Contains scripts to create tables and ingest data.
Airflow DAG: Defines the Directed Acyclic Graph (DAG) for orchestrating the ETL 
process.
dbt Project: Models and transforms the data using dbt.
Analysis: SQL queries and dashboards to answer the analytical questions.
Docker Compose File: Specifies the configuration for the project resources.

Setup and Configuration
PostgreSQL
Create Tables and Ingest Data:
The PostgreSQL scripts named ‘init.sql’ and load_data.sql are located in the postgres folder.
Run these scripts to set up the database schema and load the initial data.
Airflow
DAG Configuration:
The Airflow DAG file ‘etl_dag.py’ is located in the airflow/dags/ directory.
This DAG orchestrates the ETL process, including data extraction and loading.
dbt
dbt Models:
The dbt project is located in the ecommerce_dbt_project/ directory.
Models are organized into staging, intermediate, and final layers.
Staging models extract raw data, intermediate models perform transformations, and final models produce the results for analysis.
Configuration:
The dbt_project.yml file in the ecommerce_project.yml/ directory configures the dbt project.
The profile.yml file specifies the connection details for the data warehouse.
Docker Compose
Setup:
The docker-compose.yml file defines the Docker services for PostgreSQL and Airflow.
Use docker-compose up to start the postgres and airflow services, while ‘dbt run’ to run the dbt models.

Analytical Questions
Which product categories have the highest sales?
I selected the top 10 using the ‘Limit’ function
SQL Query: SELECT
   product_category_name,
   total_sales
FROM
   ecomm.fct_sales_by_category
ORDER BY
   total_sales DESC
LIMIT 10; 
What is the average delivery time for orders?
I rounded the figure up to zero decimal
SELECT
   CAST(ROUND(avg_delivery_time_days, 0) AS INT64) AS avg_delivery_time
FROM
   ecomm.fct_avg_delivery_time
Which states have the highest number of orders?
I selected the top 10 using the ‘Limit’ function
SQL Query: SELECT
   customer_state,
   total_orders
FROM
   ecomm.fct_orders_by_state
ORDER BY
   total_orders DESC
LIMIT 10;

Getting Started

1. Clone the repository
git clone <repository-url>
cd <repository-folder>

2. Set Up PostgreSQL:
Run the PostgreSQL scripts to create tables and ingest data

3. Start Docker container
docker-compose up

4. Run dbt models
dbt run

5. Access Airflow:
Open the Airflow web interface to monitor and manage DAGs.

Dependencies:
PostgreSQL
Airflow
dbt
Docker