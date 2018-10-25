---
title: Connect to Azure Audit Logs with Power BI
description: Azure Audit Logs for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 02/06/2018
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to Azure Audit Logs with Power BI
With the Azure Audit Logs content pack you can analyze and visualize the information stored in the audit logs. Power BI retrieves your data, builds an out-of-the box dashboard, and creates reports based on that data.

[Connect to the Azure Audit Logs content pack](https://app.powerbi.com/getdata/services/azure-audit-logs) or read more about the [Azure Audit Logs integration](https://powerbi.microsoft.com/integrations/azure-audit-logs) with Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.  
   
    ![](media/service-connect-to-azure-audit-logs/getdata.png)
2. In the **Services** box, select **Get**.  
   
    ![](media/service-connect-to-azure-audit-logs/services.png) 
3. Select **Azure Audit Logs** > **Get**.  
   
   ![](media/service-connect-to-azure-audit-logs/azureauditlogs.png)
4. When prompted, enter your **Azure Subscription Id**. See details on finding your [subscription ID](#FindingParams) below.   
   
    ![](media/service-connect-to-azure-audit-logs/parameters.png)
5. For **Authentication Method**, select **oAuth2** \> **Sign In**.
   
    ![](media/service-connect-to-azure-audit-logs/creds.png)
6. Enter your account credentials to finish the sign-in process.
   
    ![](media/service-connect-to-azure-audit-logs/login.png)
7. Power BI will retrieve your Azure Audit Log data and create a ready-to-use dashboard and report. 
   
    ![](media/service-connect-to-azure-audit-logs/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
The Azure Audit logs content pack requires access to Audit Logs in the Azure portal. More details [here](/azure/azure-resource-manager/resource-group-audit/).

<a name="FindingParams"></a>

## Finding parameters
There are two easy ways to find your Subscription Id.

1. From https://portal.azure.com -&gt; Browse -&gt; Subscriptions -&gt; Subscription Id
2. From https://manage.windowsazure.com -&gt; Settings  -&gt; Subscription Id

Your subscription Id will be long set of numbers and characters, similar to the example in Step \#4 above. 

## Troubleshooting
If you're seeing a credentials error or an error trying to refresh due to invalid credentials, try deleting all instances of the Azure Audit logs content pack and reconnecting.

## Next steps
[What is Power BI?](power-bi-overview.md)  
[Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)  

