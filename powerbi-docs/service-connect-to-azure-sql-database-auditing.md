---
title: SQL Database Auditing content pack
description: SQL Database Auditing content pack for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/09/2018
ms.author: sarinas

LocalizationGroup: Connect to services
---
# SQL Database Auditing content pack for Power BI

> [!IMPORTANT]
> The SQL Database Auditing content pack has been deprecated, and is no longer available.
 
The Power BI content pack for Azure [SQL Database Auditing](/azure/sql-database/sql-database-auditing/) allows you to understand your database activity and gain insight into discrepancies and anomalies that could indicate business concerns or suspected security violations. 

Connect to the [SQL Database Auditing content pack](https://app.powerbi.com/getdata/services/sql-db-auditing) for Power BI.

>[!NOTE]
>The content pack imports data from all tables that contain “AuditLogs” in their name and append it to a single data model table named “AuditLogs”. The last 250k events will be included and the data will be refreshed daily.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-azure-sql-database-auditing/pbi_getdata.png) 
2. In the Services box, select Get.
   
   ![](media/service-connect-to-azure-sql-database-auditing/pbi_getservices.png) 
3. Select **SQL Database Auditing** \> **Get**.
   
   ![](media/service-connect-to-azure-sql-database-auditing/sqldbaudit.png)
4. In the Connect to Sql Database Auditing window:
   
   - Enter the Azure Table Storage account name or URL where your logs are stored.
   
   - Enter the name of the SQL server that you are interested in. Enter “\*” to load audit logs for all servers.
   
   - Enter the name of the SQL database that you are interested in. Enter “\*” to load audit logs for all databases.
   
   - Enter the name of the Azure table that contains the logs you are interested. Enter “\*” to load audit logs from all tables that contain “AuditLogs” in their name.
   
   >[!IMPORTANT]
   >For performance reasons it is advisable to always specify an explicit table name even if all audit logs are stored in a single table.
   
   - Enter the start date of audit logs you are interested in. Enter “\*” to load audit logs without a lower time limit, or “1d” to load audit logs from the last day.
   
   - Enter the end date of audit logs you are interested in. Enter “\*” to load audit logs without an upper time limit.
   
   ![](media/service-connect-to-azure-sql-database-auditing/dbauditing_param.png)
5. For Authentication Method, select **Key**, enter your **Account Key** \> **Sign In**.
   
   ![](media/service-connect-to-azure-sql-database-auditing/pbi_sqlauditing3.png)
6. After Power BI imports the data, you see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*.
   
   ![](media/service-connect-to-azure-sql-database-auditing/pbi_sqldbauditingnewdash.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## Next steps
[Get data for Power BI](service-get-data.md)
[What is Power BI?](power-bi-overview.md)
