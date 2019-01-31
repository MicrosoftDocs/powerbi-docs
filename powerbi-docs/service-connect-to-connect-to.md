---
title: Connect to comScore Digital Analytix with Power BI
description: comScore Digital Analytix for Power BI
author: SarinaJoan
manager: kfile
ms.reviewer: maggiesMSFT

ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: conceptual
ms.date: 01/30/2019
ms.author: sarinas

LocalizationGroup: Connect to services
---
# Connect to comScore Digital Analytix with Power BI
Visual and explore your comScore Digital Analytix data in Power BI with the Power BI content pack. The data will be refreshed automatically once per day.

Connect to the [comScore content pack for Power BI.](https://app.powerbi.com/getdata/services/comscore)

>[!NOTE]
>To connect to the content pack you need a comScore DAx user account and have comScore API access. More [details](#Requirements) below.

## How to connect
1. Select Get Data at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-connect-to/getdata.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-connect-to/services.png)
3. Select **comScore Digital Analytix** \> **Get**.
   
   ![](media/service-connect-to-connect-to/comscore.png)
4. Provide the datacenter, comScore Client ID and Site you’d like to connect to. For more details on how to find these values, please see [Finding your comScore Parameters](#FindingParams) below.
   
   ![](media/service-connect-to-connect-to/parameters.png)
5. Provide your comScore username and password to connect. See details on finding this value below.
   
   ![](media/service-connect-to-connect-to/creds.png)
6. The import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

<a name="Requirements"></a>

## System requirements
A comScore DAx user account and access to the comScore DAx API is required to connect. Please contact your comScore DAx admin to confirm your account.

<a name="FindingParams"></a>

## Finding parameters
Details on how to find each of your comScore parameters is below.

**Data Center**

The data center you connect to is determined by the URL you navigate to in comScore.

![](media/service-connect-to-connect-to/comscore_url.png) 

**Client**

The Client is the same one you provide when signing into comScore DAx.

![](media/service-connect-to-connect-to/comscore_signin.png) 

**Site**

The comScore site determines which site you’d like to see the data from. You can find the list of sites from your comScore account.

![](media/service-connect-to-connect-to/comscore_sites.png)

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

