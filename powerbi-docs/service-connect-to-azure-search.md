---
title: Connect to Azure Search with Power BI
description: Azure Search for Power BI
services: powerbi
documentationcenter: ''
author: joeshoukry
manager: erikre
backup: maggiesMSFT
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/16/2017
ms.author: yshoukry

---
# Connect to Azure Search with Power BI
Azure Search Traffic Analytics allows you to monitor and understand the traffic to your Azure Search service. The Azure Search content pack for Power BI provides detailed insights on your Search data, including Search, Indexing, Service Stats and Latency from the last 30 days. More details can be found in the [Azure blog post](https://azure.microsoft.com/en-us/blog/analyzing-your-azure-search-traffic/).

Connect to the [Azure Search content pack](https://app.powerbi.com/getdata/services/azure-search) for Power BI.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-azure-search/pbi_getdata.png) 
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-azure-search/pbi_getservices.png) 
3. Select **Azure Search** \> **Get**.
   
   ![](media/service-connect-to-azure-search/azuresearch.png)
4. Provide the name of the table storage account your Azure Search analysis is stored.
   
   ![](media/service-connect-to-azure-search/params.png)
5. Select **Key** as the Authentication Mechanism and provide your storage account key. Click **Sign In** and to begin the loading process.
   
   ![](media/service-connect-to-azure-search/creds.png)
6. Once the loading is complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.
   
    ![](media/service-connect-to-azure-search/dashboard2.png)

**What Now?**

* Try [asking a question in the Q&A box](service-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](service-dashboard-tiles.md) to open the underlying report.
* While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## System requirements
The Azure Search content pack requires Azure Search Traffic Analytics to be enabled on the account.

## Troubleshooting
Ensure the storage account name is correctly provided along with the full access key. The storage account name should correspond to the account configured with Azure Search Traffic Analytics.

### See also
[Get started with Power BI](service-get-started.md)

[Power BI - Basic Concepts](service-basic-concepts.md)

