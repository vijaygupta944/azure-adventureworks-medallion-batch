/*
===============================================================================
 File Name   : 01_master_key.sql
 Purpose     : Create Master Key for Synapse database
 Author      : <Vijay Gupta>
 Description :
   - Creates a database master key required to securely store credentials
   - Mandatory prerequisite for Database Scoped Credentials
   - Executed once per database
===============================================================================
*/


USE adventureworks_dw;
GO

-- Create Master Key
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Strog@Password123';
GO
