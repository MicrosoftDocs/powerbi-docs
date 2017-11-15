---
title: Connect to Office365Mon with Power BI
description: Office365Mon for Power BI
services: powerbi
documentationcenter: ''
author: joeshoukry
manager: kfile
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
# Connect to Office365Mon with Power BI
Analyzing your Office 365 outages and health performance data is easy with Power BI and the Office365Mon content pack. Power BI retrieves your data, including outages and health probes, then builds an out-of-box dashboard and reports based on that data.

Connect to the [Office365Mon content pack](https://app.powerbi.com/groups/me/getdata/services/office365mon) for Power BI.

Note: An Office365Mon admin account is required to connect and load the Power BI content pack.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-office365mon/pbi_getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-office365mon/pbi_getservices.png) 
3. Select **Office365Mon** \> **Get**.
   
   ![](media/service-connect-to-office365mon/o365mon.png)
4. For Authentication Method, select **oAuth2** \> **Sign In**.
   
   When prompted, enter your Office365Mon admin credentials and follow the authentication process.
   
   ![](media/service-connect-to-office365mon/creds.png)
   
   ![](media/service-connect-to-office365mon/creds2.png)
5. After Power BI imports the data you will see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*, select the Office365Mon entry.
   
   ![](media/service-connect-to-office365mon/dashboard4.png)

**What now?**

* Try [asking a question in the Q&A box](service-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](service-dashboard-tiles.md) to open the underlying report.
* While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## Troubleshooting
If you get a **"login failed"** error after using your Office365Mon subscription credentials to login, then the account you are using doesn't have permissions to retrieve the Office365Mon data from your account. Verify it is an admin account and try again.

## Next steps
[Get started with Power BI](service-get-started.md)

[Get Data for Power BI](service-get-data.md)

