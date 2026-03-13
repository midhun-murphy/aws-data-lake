# AWS Data Lake Pipeline (Bronze–Silver–Gold Architecture)

## Project Overview

This project demonstrates how to build a **Data Lake pipeline on AWS** using **Amazon S3, PySpark on EC2, and Amazon Athena**.

The pipeline follows the **Bronze–Silver–Gold data architecture** commonly used in modern data engineering systems.

Raw CSV data is ingested into the **Bronze layer**, processed using **PySpark ETL**, transformed into clean datasets in the **Silver layer**, and finally aggregated into analytics-ready data in the **Gold layer** which can be queried using **Amazon Athena**.

---

## Architecture Diagram

![AWS Data Lake Architecture](architecture/image.png)

---

## Data Pipeline Workflow

The pipeline follows this workflow:

Raw Data → S3 Bronze Layer → PySpark ETL (EC2) → S3 Silver Layer → S3 Gold Layer → Athena Analytics

### 1. Raw Data Source

CSV files are used as the raw dataset and uploaded to Amazon S3.

### 2. Bronze Layer (Raw Data Storage)

The Bronze layer stores **raw ingested data** exactly as received from the source.

Purpose:

* Preserve original data
* Enable reprocessing if needed

### 3. PySpark ETL Processing

An **EC2 instance running PySpark** performs ETL operations:

* Read raw CSV files from S3
* Clean and transform the data
* Apply schema and data formatting
* Write processed datasets back to S3

### 4. Silver Layer (Cleaned Data)

The Silver layer contains **cleaned and transformed datasets**.

Purpose:

* Remove duplicates
* Handle missing values
* Standardize data formats

### 5. Gold Layer (Analytics Ready Data)

The Gold layer stores **aggregated datasets optimized for analytics and reporting**.

Examples:

* summary tables
* aggregated metrics
* analytical datasets

### 6. Amazon Athena Analytics

Amazon Athena is used to **query the Gold layer data directly from S3 using SQL**.

This allows performing analytics without managing servers.

---

## Technology Stack

* AWS S3
* AWS EC2
* PySpark
* Amazon Athena
* Python
* AWS IAM

---

## Project Structure

```
aws-data-lake
│
├── architecture
│   └── image.png
│
├── screenshots
│   ├── athena-query-result
│   ├── pyspark-etl-process
│   ├── s3-bronze-layer
│   ├── s3-silver-layer
│   └── s3-gold-layer
│
└── README.md
```

---

## Screenshots

### Bronze Layer (Raw Data in S3)

Shows raw CSV files stored in the Bronze layer.

### PySpark ETL Processing

PySpark running on EC2 performing ETL transformations.

### Silver Layer (Clean Data)

Cleaned datasets stored in the Silver layer.

### Gold Layer (Aggregated Data)

Analytics-ready datasets stored in the Gold layer.

### Athena Query Results

Querying processed data using Amazon Athena.

---

## Key Learning Outcomes

Through this project I learned:

* Designing a **Data Lake architecture**
* Implementing **Bronze–Silver–Gold data layers**
* Performing **ETL using PySpark**
* Using **Amazon S3 as a scalable data lake storage**
* Running **SQL analytics with Amazon Athena**

---

## Future Improvements

Possible enhancements:

* Automate ETL using **AWS Glue**
* Schedule pipelines using **Apache Airflow**
* Create dashboards using **Power BI or AWS QuickSight**
* Implement **data catalog using AWS Glue Data Catalog**

---
