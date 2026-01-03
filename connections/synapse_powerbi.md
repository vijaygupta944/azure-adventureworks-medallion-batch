

# Synapse ↔ Power BI Connection

## Purpose
Allow Power BI to consume analytics-ready Gold datasets stored in Azure Synapse Analytics.

---

## Connection Type
Azure Synapse Analytics SQL Endpoint

---

## Where to Get SQL Endpoint

1. Go to **Azure Portal**
2. Open **Synapse Workspace**
3. Under **Essentials**
4. Copy: Serverless SQL Endpoint


---

## Authentication Method
SQL Authentication (created during Synapse setup)

---

## Connection Steps in Power BI

1. Open **Power BI Desktop**
2. Click **Get Data**
3. Select: Azure → Azure Synapse Analytics SQL
4. Paste SQL Endpoint
5. Choose authentication
6. Select Gold tables (e.g. `gold.ext_sales`)

---

## Connection Mode Used
Import Mode

---

## Why Import Mode?

- Faster report rendering
- Lower load on Synapse
- Reduced cost
- Best for batch analytics

---

## Why Not DirectQuery?

- Slower dashboards
- Higher operational cost

---

#### Conclusion:
“Power BI connects to Synapse Gold tables using Import mode to deliver fast, scalable dashboards built on curated data.”



