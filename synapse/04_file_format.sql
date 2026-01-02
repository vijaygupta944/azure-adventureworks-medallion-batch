/*
===============================================================================
 File Name   : 04_file_format.sql
 Purpose     : Create External File Format for Parquet files
 Author      : Vijay Gupta
 Description :
   - Defines how Synapse reads and writes Parquet files in ADLS
   - Reusable across views, external tables, and CETAS
   - Optimized for analytics workloads
===============================================================================
*/

USE adventureworks_dw;
GO

/*-----------------------------------------------------------------------------
  External File Format : PARQUET
  Used by Serverless SQL for reading/writing Parquet data
-----------------------------------------------------------------------------*/
CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
GO
