/*
===============================================================================
 File Name   : 02_credentials.sql
 Purpose     : Create Database Scoped Credential using Managed Identity
 Author      : Vijay Gupta
 Description :
   - Creates a database scoped credential for Azure Synapse
   - Uses Managed Identity to authenticate with ADLS Gen2
   - Eliminates the need for secrets or access keys
===============================================================================
*/

USE adventureworks_dw;
GO

-- Create Database Scoped Credential using Managed Identity
CREATE DATABASE SCOPED CREDENTIAL cred_managed_identity
WITH IDENTITY = 'Managed Identity';
GO
