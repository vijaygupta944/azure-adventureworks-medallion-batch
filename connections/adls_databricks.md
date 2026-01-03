# ADLS ↔ Databricks Connection

## Purpose
Enable Azure Databricks to securely read data from and write data to Azure Data Lake Storage Gen2.

This connection is required for:
- Reading Bronze data
- Writing Silver and Reject data
- Writing audit logs

---

## Authentication Method
Service Principal (Azure Entra ID – App Registration)

---

## Why Service Principal?

A Service Principal is a **non-human application identity** used by services.

### Real-life Analogy
> “If Databricks wants to enter ADLS, the Service Principal acts like a ticket to enter the Taj Mahal.”

---

## High-Level Flow

Azure Databricks
↓
Service Principal (App Registration)
↓
OAuth Authentication
↓
Azure Data Lake Storage Gen2



---

## Step-by-Step Setup

### Step 1: Create Service Principal (App Registration)

1. Go to **Azure Portal**
2. Search for **Microsoft Entra ID**
3. Click **App Registrations**
4. Click **+ New Registration**
5. Provide:
   - Name
   - Default directory
6. Click **Register**

After registration, capture:
- **Application (Client) ID**
- **Directory (Tenant) ID**

---

### Step 2: Generate Client Secret

1. Go to **Certificates & Secrets**
2. Click **+ New Client Secret**
3. Provide description and expiry
4. Click **Add**
5. **Copy the secret value immediately**

This value will not be visible again.

---

### Step 3: Assign Role on ADLS

1. Go to **Storage Account**
2. Click **Access Control (IAM)**
3. Click **+ Add Role Assignment**
4. Role: Storage Blob Data Contributor
5. Assign access to: Service Principal (App Registration)


---

### Step 4: Configure Databricks OAuth

Run the following in Databricks notebook (after replacing placeholders):

spark.conf.set(
"fs.azure.account.auth.type.<storage-account>.dfs.core.windows.net",
"OAuth"
)

spark.conf.set(
"fs.azure.account.oauth.provider.type.<storage-account>.dfs.core.windows.net",
"org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider"
)

spark.conf.set(
"fs.azure.account.oauth2.client.id.<storage-account>.dfs.core.windows.net",
"<application-id>"
)

spark.conf.set(
"fs.azure.account.oauth2.client.secret.<storage-account>.dfs.core.windows.net",
"<client-secret>"
)

spark.conf.set(
"fs.azure.account.oauth2.client.endpoint.<storage-account>.dfs.core.windows.net",
"https://login.microsoftonline.com/<tenant-id>/oauth2/token"
)

#### File Path Format Used in Databricks:

abfss://<container>@<storage-account>.dfs.core.windows.net/<path>

Example:

spark.read.csv(
  "abfss://bronze@storagedemo01.dfs.core.windows.net/sales/AdventureWorks_Sales_2018.csv",
  header=True
)



