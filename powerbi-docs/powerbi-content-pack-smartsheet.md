---
title: Connect to Smartsheet with Power BI
description: Smartsheet for Power BI
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
# Connect to Smartsheet with Power BI
Smartsheet offers an easy platform for collaboration and file sharing. The Smartsheet content pack for Power BI provides a dashboard, reports and dataset that shows an overview of your Smartsheet account. You can also use the [Power BI Desktop](powerbi-desktop-connect-to-data.md) to connect directly to individual sheets in your account. 

Connect to the [Smartsheet content pack](https://app.powerbi.com/groups/me/getdata/services/smartsheet) for Power BI.

Note: Smartsheet admin account is preferred to connect and load the Power BI content pack as it has additional access.

## How to Connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/powerbi-content-pack-smartsheet/PBI_GetData.png)
2. In the **Services** box, select **Get**.
   
   ![](media/powerbi-content-pack-smartsheet/PBI_GetServices.png) 
3. Select **Smartsheet \> Get**.
   
   ![](media/powerbi-content-pack-smartsheet/smartsheet.png)
4. For Authentication Method, select **oAuth2 \> Sign In**.
   
   When prompted, enter your Smartsheet credentials and follow the authentication process.
   
   ![](media/powerbi-content-pack-smartsheet/creds.png)
   
   ![](media/powerbi-content-pack-smartsheet/creds2.png)
5. After Power BI imports the data you will see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*, select the Smartsheet entry.
   
   ![](media/powerbi-content-pack-smartsheet/dashboard.png)

**What Now?**

* Try [asking a question in the Q&A box](service-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](service-dashboard-tiles.md) to open the underlying report.
* While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The Smartsheet content pack for Power BI includes an overview of your Smartsheet account, such as the number of workspaces, reports and sheets you have, when they're modified etc. Admin users will also see some information around the users in their system, such as top sheet creators.  

To connect directly to individual sheets in your account, you can use the Smartsheet connector in the [Power BI Desktop](powerbi-desktop-connect-to-data.md).  

### See Also:
[Get started with Power BI](service-get-started.md)

[Get Data for Power BI](service-get-data.md)

