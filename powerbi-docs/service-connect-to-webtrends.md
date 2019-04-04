---
title: Connect to Webtrends with Power BI
description: Webtrends for Power BI
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
# Connect to Webtrends with Power BI
The Webtrends content pack for Power BI includes a variety of out of box metrics such total page views and visits by traffic source. Visualizing your Webtrends data in Power BI starts by connecting to your Webtrends account. You can use the dashboard and reports provided, or customize them to highlight the information you care most about.  The data will be refreshed automatically once per day.

Connect to the [Webtrends content pack for Power BI.](https://app.powerbi.com/getdata/services/webtrends)

## How to connect
1. Select **Get Data** at the bottom of the left navigation pane.
   
   ![](media/service-connect-to-webtrends/getdata3.png)
2. In the **Services** box, select **Get**.
   
   ![](media/service-connect-to-webtrends/services.png)
3. Select **Webtrends** \> **Get**.
   
   ![](media/service-connect-to-webtrends/webtrends.png)
4. The content pack connects to a specific Webtrends profile ID. See details on [finding this parameter](#FindingParams) below.
   
   ![](media/service-connect-to-webtrends/parameters.png)
5. Provide your Webtrends credentials to connect. Note that the username field expects your account and username. See [details](#FindingParams) below.
   
   ![](media/service-connect-to-webtrends/creds.png)
6. After approving, the import process will begin automatically. When complete, a new dashboard, report and model will appear in the Navigation Pane. Select the dashboard to view your imported data.
   
   ![](media/service-connect-to-webtrends/dashboard.png)

**What now?**

* Try [asking a question in the Q&A box](consumer/end-user-q-and-a.md) at the top of the dashboard
* [Change the tiles](service-dashboard-edit-tile.md) in the dashboard.
* [Select a tile](consumer/end-user-tiles.md) to open the underlying report.
* While your dataset will be scheduled to refresh daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
<a name="Included"></a>

The Webtrends content pack pulls data from the following reports:  

| Report Name | Report ID |
| --- | --- |
| Key Metrics | |
| On-Site Searches |34awBVEP0P6 |
| Exit Pages |7FshY8eP0P6 |
| Next Pages |CTd5rpeP0P6 |
| Previous Pages |aSdOeaUgnP6 |
| Site Pages |oOEWQj3sUo6 |
| Onsite Ads Clickthroughs |41df19b6d9f |
| Cities |aUuHskcP0P6 |
| Countries |JHWXJNcP0P6 |
| Visitors |xPcmTDDP0P6 |
| Visit Duration |U5KAyqdP0P6 |
| Search Phrases |IKYEDxIP0P6 |
| Traffic Sources |JmttAoIP0P6 |
| Search Engines |yGz3gAGP0P6 |
| Entry Pages |i6LrkNVRUo6 |

>[!NOTE]
>For SharePoint profiles, the metric names may be a little different than what's show in the Webtrends UI. The following mapping is done to maintain consistency between SharePoint and Web profiles:   

    - Sessions = Visits  
    - New Users = New Visitors  
    - Views per Session = Page Views per Visit  
    - Avg Daily User Duration = Avg Time on Site per Visitor  

## System requirements
The content pack requires access to a Webtrends profile with the [correct set of reports](#Included) enabled.

<a name="FindingParams"></a>

## Finding parameters
Your Webtrends Profile ID can be found in the URL after you've selected a profile:

![](media/service-connect-to-webtrends/webtrendsparameters.png)

Your credentials are the same as what you enter when you sign into Webtrends, however we expect your account and username in the same line, separated by a backslash:

![](media/service-connect-to-webtrends/webtrendscreds.png)

## Troubleshooting
You may hit an issue while the content pack is loading, after you've provided your credentials. If you see the "Oops" message during the loading, please review the troubleshooting suggestions below. If you're still having issues please file a support ticket at https://support.powerbi.com

1. The correct Profile ID is being used, see the [Finding Parameters](#FindingParams) for more details.
2. The user has access to the reports listed in the ["What's included"](#Included) section

## Next steps
[What is Power BI?](power-bi-overview.md)

[Power BI - Basic Concepts](consumer/end-user-basic-concepts.md)

