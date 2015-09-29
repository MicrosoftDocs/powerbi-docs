<properties 
   pageTitle="SQL Database Auditing content pack for Power BI"
   description="SQL Database Auditing content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/18/2015"
   ms.author="v-anpasi"/>
# SQL Database Auditing content pack for Power BI

[← Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770-services-in-power-bi)

The Power BI content pack for Azure [SQL Database Auditing](http://azure.microsoft.com/en-us/documentation/articles/sql-database-auditing-get-started/) allows you to understand your database activity and gain insight into discrepancies and anomalies that could indicate business concerns or suspected security violations. 

The content pack imports data from all tables that contain “AuditLogs” in their name and append it to a single data model table named “AuditLogs”. The last 250k events will be included and the data will be refreshed daily.

Connect to the [SQL Database Auditing content pack](https://app.powerbi.com/getdata/services/sql-db-auditing) for Power BI.

1.  Select **Get Data** at the bottom of the left navigation pane.

    ![](media/powerbi-azure-sql-database-auditing-connector/PBI_GetData.png) 

2.  In the Services box, select Get.

    ![](media/powerbi-azure-sql-database-auditing-connector/PBI_GetServices.png) 

3.  Select **SQL Database Auditing** \> **Connect**.

    ![](media/powerbi-azure-sql-database-auditing-connector/PBI_SQLdbAuditing.png)

4.  In the Connect to Sql Database Auditing window:

    • Enter the Azure Table Storage account name or URL where your logs are stored.

    • Enter the name of the SQL server that you are interested in. Enter “\*” to load audit logs for all servers.

    • Enter the name of the SQL database that you are interested in. Enter “\*” to load audit logs for all databases.

    • Enter the name of the Azure table that contains the logs you are interested. Enter “\*” to load audit logs from all tables that contain “AuditLogs” in their name.

    Important: For performance reasons it is advisable to always specify an explicit table name even if all audit logs are stored in a single table.

    • Enter the start date of audit logs you are interested in. Enter “\*” to load audit logs without a lower time limit, or “1d” to load audit logs from the last day.

    • Enter the end date of audit logs you are interested in. Enter “\*” to load audit logs without an upper time limit.

    ![](media/powerbi-azure-sql-database-auditing-connector/dbauditing_param.png)

5.  For Authentication Method, select **Key**, enter your** Account Key** \> **Sign In**.

    ![](media/powerbi-azure-sql-database-auditing-connector/PBI_SQLAuditing3.png)

6.  After Power BI imports the data, you see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*.


![](media/powerbi-azure-sql-database-auditing-connector/PBI_SQLdbAuditingNewDash.png)

 

You can change this dashboard to display your data the way you want it. Plus you can ask a [question in ](http://support.powerbi.com/knowledgebase/articles/474566-q-a-in-power-bi)[Q&A](http://support.powerbi.com/knowledgebase/articles/474566-q-a-in-power-bi) or click a tile to [open the underlying report](http://support.powerbi.com/knowledgebase/articles/425669-when-you-click-a-tile-in-a-dashboard) and [c](http://support.powerbi.com/knowledgebase/articles/424878-edit-a-tile-resize-move-rename-delete)[](http://support.powerbi.com/knowledgebase/articles/424878-edit-a-tile-resize-move-rename-delete)[hange the tiles](http://support.powerbi.com/knowledgebase/articles/424878-edit-a-tile-resize-move-rename-delete) in the dashboard. 

 

