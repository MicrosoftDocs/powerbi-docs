---
title: Connect to Azure Search with Power BI
description: Azure Search for Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: maggiesMSFT
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 08/29/2019
LocalizationGroup: Connect to services
---
# Connect to Azure Search with Power BI
Azure Search Traffic Analytics allows you to monitor and understand the traffic to your Azure Search service. The Azure Search app for Power BI provides detailed insights on your Search data, including Search, Indexing, Service Stats and Latency from the last 30 days. More details can be found in the [Azure blog post](https://azure.microsoft.com/blog/analyzing-your-azure-search-traffic/).

[!INCLUDE [include-short-name](../includes/service-deprecate-content-packs.md)]

Connect to the [Azure Search app](https://app.powerbi.com/getdata/services/azure-search) for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the nav pane.
   
   ![Screenshot of the Get Data in Power B I Desktop, showing the button in the navigator pane.](media/service-connect-to-azure-search/pbi_getdata.png) 
2. In the **Services** box, select **Get**.
   
   ![Screenshot of the Services dialog, showing the Get button.](media/service-connect-to-azure-search/pbi_getservices.png) 
3. Select **Azure Search** \> **Get**.
   
   ![Screenshot of the Azure Services dialog, showing the Get link.](media/service-connect-to-azure-search/azuresearch.png)
4. Provide the name of the table storage account your Azure Search analysis is stored.
   
   ![Screenshot of the Connect Azure Search dialog, showing the Azure storage account name field.](media/service-connect-to-azure-search/params.png)
5. Select **Key** as the Authentication Mechanism and provide your storage account key. Click **Sign In** and to begin the loading process.
   
   ![Screenshot of the Connect Azure Search dialog, showing Key is entered in the Authentication method field.](media/service-connect-to-azure-search/creds.png)
6. Once the loading is complete, a new dashboard, report and model will appear in the nav pane. Select the dashboard to view your imported data.
   
    ![Screenshot of the navigation pane, showing the dashboard, report, and model.](media/service-connect-to-azure-search/dashboard2.png)

**What now?**

* Try [asking a question in the Q&A box](../consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](../create-reports/service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](../consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
The Azure Search app requires Azure Search Traffic Analytics to be enabled on the account.

## Troubleshooting
Ensure the storage account name is correctly provided along with the full access key. The storage account name should correspond to the account configured with Azure Search Traffic Analytics.

## Next steps
[What is Power BI?](../fundamentals/power-bi-overview.md)

[Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)
