/*
===============================================================================
 File Name   : 05_views.sql
 Purpose     : Create Serverless SQL Views on Silver Layer data
 Author      : Vijay Gupta
 Description :
   - Uses OPENROWSET to query Parquet files in ADLS Silver layer
   - Creates logical abstraction (views) over lake data
   - No data is stored or materialized at this stage
===============================================================================
*/

USE adventureworks_dw;
GO

/*-----------------------------------------------------------------------------
  View : vw_sales
  Description :
    - Logical view over Silver sales Parquet files
    - Acts as abstraction layer between ADLS and SQL
-----------------------------------------------------------------------------*/
CREATE OR ALTER VIEW gold.vw_sales
AS
SELECT
    order_date,
    order_year,
    order_month,
    product_key,
    customer_key,
    sales_amount
FROM OPENROWSET(
        BULK 'sales/*.parquet',
        DATA_SOURCE = 'source_silver',
        FORMAT = 'PARQUET'
     ) AS sales;
GO
