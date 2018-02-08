---
title: Connect to Application Insights Connect to  Power BI
description: Application Insights for Power BI
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
# Connect to Application Insights with Power BI
Use Power BI to create powerful custom dashboards from [Application Insights](https://azure.microsoft.com/documentation/articles/app-insights-overview/) telemetry. Envision your app telemetry in new ways. Combine metrics from multiple apps or component services onto one dashboard. This first release of the Power BI content pack for Application Insights includes widgets for common usage-related metrics such as active users, page view, sessions, browser and OS version, and geographic distribution of users in a map.

Connect to the [Application Insights content pack for Power BI](https://app.powerbi.com/getdata/services/application-insights).

>[!NOTE]
>Access to the Application Insights overview blade for your application in the Azure Preview Portal is required to connect. More details on requirements below.

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
    ![Get Data button](media/service-connect-to-application-insights/pbi_getdata.png)
2. In the **Services** box, select **Get**.
   
    ![Get Services button](media/service-connect-to-application-insights/pbi_getservices.png)
3. Select **Application Insights** > **Get**.
   
    ![Application Insights content pack](media/service-connect-to-application-insights/appinsights.png)
4. Provide the details of the application you want to connect to, including **Application Insights Resource Name**, **Resource Group**, and **Subscription ID**. See [Finding your Application Insights parameters](#FindingAppInsightsParams) below for more details.
   
    ![Application Insights connection dialog box](media/service-connect-to-application-insights/pbi_contpkappinsitconnectndialog.png)    
5. Select **Sign In** and follow the screens to connect.
   
    ![Application Insights connection sign-in](media/service-connect-to-application-insights/pbi_contpkappinsitconnectn2.png)
6. The import process begins automatically. When complete, a notification is shown and a new dashboard, report, and dataset appear in the Navigation Pane marked with an asterisk.  Select the dashboard to view your imported data.
   
    ![Application Insights dashboard](media/service-connect-to-application-insights/pbi_contpkappinsitdash.png)

**What now?**

* Try [asking a question in the Q&A box](power-bi-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](service-dashboard-tiles.md) to open the underlying report.
* While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The Application Insights content pack includes the following tables and metrics:  

    ´´´
    - ApplicationDetails  
    - UniqueUsersLast7Days   
    - UniqueUsersLast30Days   
    - UniqueUsersDailyLast30Days  
    - UniqueUsersByCountryLast7Days  
    - UniqueUsersByCountryLast30Days   
    - PageViewsDailyLast30Days   
    - SessionsLast7Days   
    - SessionsLast30Days  
    - PageViewsByBrowserVersionDailyLast30Days   
    - UniqueUsersByOperatingSystemLast7Days   
    - UniqueUsersByOperatingSystemLast30Days    
    - SessionsDailyLast30Days   
    - SessionsByCountryLast7Days   
    - SessionsByCountryLast30Days   
    - PageViewsByCountryDailyLast30Days  
        ´´´ 

<a name="FindingAppInsightsParams"></a>

## Finding parameters
Your Resource Name, Resource Group and Subscription ID can all be found in the Azure Portal. Selecting the Name will open a detailed view and you can use the Essentials drop-down to find all the values you need.

![Application Insights parameters](media/service-connect-to-application-insights/pbi_contpkappinsitparams.png)

Copy and paste these into the fields into Power BI:

![Application Insights parameters](media/service-connect-to-application-insights/pbi_contpkappinsitparam2.png)

## Next steps
[Get started in Power BI](service-get-started.md)

[Get data in Power BI](service-get-data.md)

