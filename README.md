# 🛒 E-Commerce Data Pipeline Project

## 📌 Overview
This project implements a complete data pipeline for analyzing an e-commerce dataset. It includes:

- **PostgreSQL scripts** for data ingestion  
- **Airflow DAG** for orchestrating ETL workflows  
- **dbt models** for data transformation  
- **SQL-based analysis** to answer key business questions  
- **Docker** for containerizing all services  

This setup demonstrates a modern analytics engineering workflow from raw data to insights.

---

## 📁 Project Structure

### **PostgreSQL Scripts**
Located in the `postgres/` directory:
- `init.sql` – Creates database tables  
- `load_data.sql` – Loads raw e-commerce data  

### **Airflow DAG**
Located at `airflow/dags/etl_dag.py`:
- Manages the end-to-end ETL workflow  

### **dbt Project**
Located in `ecommerce_dbt_project/`:
- **Staging models:** Extract raw source data  
- **Intermediate models:** Apply business logic  
- **Final models:** Produce analytical outputs  

### **Configuration Files**
- `dbt_project.yml` – Configures the dbt project  
- `profiles.yml` – Defines dbt connection settings  
- `docker-compose.yml` – Defines PostgreSQL and Airflow services  

---

## ⚙️ Setup and Configuration

### **1. PostgreSQL Setup**
Run the scripts inside the `postgres/` directory to initialize the schema and ingest data:

```bash
psql -f init.sql
psql -f load_data.sql


# Getting Started
## Clone the repository
git clone https://github.com/sulaimonibrahim/Ecommerce_Project.git
cd Ecommerce_Project

## Start Docker Services
docker-compose up

## Run dbt models
dbt run

## Access Airflow (visit the airflow UI)
http://localhost:8080

