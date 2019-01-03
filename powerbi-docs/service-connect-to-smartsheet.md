---
title: Connect to Smartsheet with Power BI
description: Smartsheet for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 10/16/2017
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to Smartsheet with Power BI
Smartsheet offers an easy platform for collaboration and file sharing. The Smartsheet content pack for Power BI provides a dashboard, reports and dataset that shows an overview of your Smartsheet account. You can also use the [Power BI Desktop](desktop-connect-to-data.md) to connect directly to individual sheets in your account. 

Connect to the [Smartsheet content pack](https://app.powerbi.com/groups/me/getdata/services/smartsheet) for Power BI.

>[!NOTE]
>Smartsheet admin account is preferred to connect and load the Power BI content pack as it has additional access.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-smartsheet/pbi_getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-smartsheet/pbi_getservices.png) 
3. Select **Smartsheet \> Get**.
   
   ![](media/service-connect-to-smartsheet/smartsheet.png)
4. For Authentication Method, select **oAuth2 \> Sign In**.
   
   When prompted, enter your Smartsheet credentials and follow the authentication process.
   
   ![](media/service-connect-to-smartsheet/creds.png)
   
   ![](media/service-connect-to-smartsheet/creds2.png)
5. After Power BI imports the data you will see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*, select the Smartsheet entry.
   
   ![](media/service-connect-to-smartsheet/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The Smartsheet content pack for Power BI includes an overview of your Smartsheet account, such as the number of workspaces, reports and sheets you have, when they're modified etc. Admin users will also see some information around the users in their system, such as top sheet creators.  

To connect directly to individual sheets in your account, you can use the Smartsheet connector in the [Power BI Desktop](desktop-connect-to-data.md).  

## Next steps:

[What is Power BI?](power-bi-overview.md)

[Get Data for Power BI](service-get-data.md)