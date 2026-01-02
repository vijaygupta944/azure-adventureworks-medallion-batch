/*
===============================================================================
 File Name   : 03_external_data_sources.sql
 Purpose     : Create External Data Sources for ADLS
 Author      : Vijay Gupta
 Description :
   - Defines external data sources pointing to ADLS Gen2 containers
   - Uses Managed Identity for secure access
   - Avoids repeating long ADLS URLs in queries
===============================================================================
*/

USE adventureworks_dw;
GO

/*-----------------------------------------------------------------------------
  External Data Source : SILVER LAYER
  Points to curated Parquet data produced by Databricks
-----------------------------------------------------------------------------*/
CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION   = 'https://deproject1.dfs.core.windows.net/silver',
    CREDENTIAL = cred_managed_identity
);
GO

/*-----------------------------------------------------------------------------
  External Data Source : GOLD LAYER
  Points to analytics-ready datasets created using CETAS
-----------------------------------------------------------------------------*/
CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION   = 'https://deproject1.dfs.core.windows.net/gold',
    CREDENTIAL = cred_managed_identity
);
GO
