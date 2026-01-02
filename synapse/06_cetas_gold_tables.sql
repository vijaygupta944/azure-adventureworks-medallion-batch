/*
===============================================================================
 File Name   : 06_cetas_gold_tables.sql
 Purpose     : Create Gold layer external tables using CETAS
 Author      : Vijay Gupta
 Description :
   - Materializes analytics-ready datasets into ADLS Gold layer
   - Uses CREATE EXTERNAL TABLE AS SELECT (CETAS)
   - Provides reusable, BI-ready data for Power BI
===============================================================================
*/

USE adventureworks_dw;
GO

/*-----------------------------------------------------------------------------
  Gold External Table : ext_sales
  Description :
    - Physical Parquet data written to ADLS Gold container
    - Built from Silver layer via Serverless SQL view
-----------------------------------------------------------------------------*/
CREATE EXTERNAL TABLE gold.ext_sales
WITH (
    LOCATION    = 'sales/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    order_date,
    order_year,
    order_month,
    product_key,
    customer_key,
    sales_amount
FROM gold.vw_sales;
GO
