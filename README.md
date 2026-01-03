# Azure End-to-End Batch Data Engineering Project

## **AdventureWorks Analytics – Medallion Architecture**

---

## Project Overview

This project demonstrates a **production-grade, batch-only data engineering platform on Azure**, built using **Medallion Architecture (Bronze → Silver → Gold)**.

It focuses on **scalability, security, cost optimization, and reprocessing**, reflecting how **real enterprises design analytics platforms**.

---

## Architecture (High Level)

```
GitHub (HTTP / CSV)
        ↓
Azure Data Factory (Batch Orchestration)
        ↓
ADLS Gen2 – Bronze (Raw Data)
        ↓
Azure Databricks – Silver (Cleaned & Optimized)
        ↓
Azure Synapse Analytics – Gold (CETAS External Tables)
        ↓
Power BI (Dashboards)
```

**Processing Model:** Batch-only
**Design Pattern:** Lake-first, Medallion Architecture

---

## Tech Stack

* **Orchestration:** Azure Data Factory
* **Storage:** Azure Data Lake Storage Gen2
* **Processing:** Azure Databricks (PySpark)
* **Analytics:** Azure Synapse Analytics (Serverless SQL)
* **Visualization:** Power BI

---

## Bronze Layer – Raw Ingestion

* Metadata-driven ingestion from GitHub (HTTP)
* Immutable raw CSV files
* Schema-on-read
* Reprocessing supported

**ADF Pattern:** `Lookup → ForEach → Copy`

---

## Silver Layer – Curated Data (Databricks)

* Schema enforcement & type casting
* Data quality checks & quarantined rejects
* Deduplication
* Incremental processing (watermark-based)
* CSV → Parquet conversion
* Partitioned by `order_year`

✔ Idempotent & re-runnable
✔ Cost-optimized for analytics

---

## Gold Layer – Analytics (Synapse)

* **Serverless SQL** (no infrastructure management)
* `OPENROWSET()` views for abstraction
* **CETAS** to materialize Gold data in ADLS
* BI-ready external tables

> *Views are logical; CETAS creates physical datasets.*

---

## Power BI

* Connected to **Synapse SQL Endpoint**
* Import mode for performance
* Executive-level sales dashboards
* Optimized for batch analytics

---

## Security & Identity

| Service            | Authentication     |
| ------------------ | ------------------ |
| ADF → ADLS         | Managed Identity   |
| Databricks → ADLS  | Service Principal  |
| Synapse → ADLS     | Managed Identity   |
| Power BI → Synapse | SQL Authentication |

✔ No secrets in code
✔ Enterprise-grade access control

---

## Repository Highlights

* `adf/` → Metadata-driven pipelines
* `databricks/` → Advanced Silver processing notebooks
* `synapse/` → Serverless SQL & CETAS scripts
* `powerbi/` → BI dashboard
* `connections/` → Detailed service-to-service connectivity docs

---

## Vijay Gupta

**Azure Data Engineer | Big Data**

---

