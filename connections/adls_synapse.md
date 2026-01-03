
---

# ADLS ↔ Synapse Connection

## Purpose
Enable Azure Synapse Analytics to:
- Query Silver data in ADLS
- Write Gold data using CETAS
- Access Data Lake without secrets

---

## Authentication Method
Managed Identity (System Assigned)

---

## What Is Managed Identity?

Managed Identity is an **Azure-provided identity** automatically created for each Azure service.

### Real-Life Analogy
> “Managed Identity is like an ID card automatically issued to Synapse by Azure.”

---

## Why Managed Identity?

- No passwords
- No secrets
- Azure-managed lifecycle

---

## High-Level Flow

Azure Synapse Workspace
↓
Managed Identity
↓
Azure RBAC
↓
Azure Data Lake Storage


---

## Step-by-Step Setup

### Step 1: Enable Managed Identity

Managed Identity is **enabled by default** for Synapse Workspace.

---

### Step 2: Assign Role on ADLS

1. Go to **Storage Account**
2. Click **Access Control (IAM)**
3. Click **+ Add Role Assignment**
4. Role: Storage Blob Data Contributor
5. Assign access to: Managed Identity → Synapse Workspace


Wait 10–15 minutes for role propagation.

---

### Step 3: Create Database Scoped Credential

CREATE DATABASE SCOPED CREDENTIAL cred_managed_identity
WITH IDENTITY = 'Managed Identity';

This tells Synapse: “Use your own identity to access ADLS.”

### Step 4: Create External Data Sources
CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://<storage>.dfs.core.windows.net/silver',
    CREDENTIAL = cred_managed_identity
);

CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://<storage>.dfs.core.windows.net/gold',
    CREDENTIAL = cred_managed_identity
);

Why This Matters
- Enables OPENROWSET
- Enables CETAS
- Secure lake-first architecture

#### Conclusion:
“Synapse accesses ADLS using **Managed Identity**, eliminating secrets and following Azure-native security best practices.”



