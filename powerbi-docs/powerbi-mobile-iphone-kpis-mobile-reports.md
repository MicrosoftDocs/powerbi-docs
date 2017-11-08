---
title: View on-premises reports and KPIs in the Power BI mobile apps
description: The Power BI mobile apps offer live, touch-enabled mobile access to your on-premises business information in SQL Server Reporting Services and Power BI Report Server.
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/13/2017
ms.author: maggies

---
# View on-premises report server reports and KPIs in the Power BI mobile apps
Applies to:

| ![iPhone](media/powerbi-mobile-iphone-kpis-mobile-reports/iphone-logo-50-px.png) | ![iPad](media/powerbi-mobile-iphone-kpis-mobile-reports/ipad-logo-50-px.png) | ![Android phone](media/powerbi-mobile-iphone-kpis-mobile-reports/android-phone-logo-50-px.png) | ![Android tablet](media/powerbi-mobile-iphone-kpis-mobile-reports/android-tablet-logo-50-px.png) |
|:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

The Power BI mobile apps deliver live, touch-enabled mobile access to your on-premises business information in Power BI Report Server and SQL Server 2016 Reporting Services (SSRS). 

 ![Report Server home in the mobile apps](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ipad-pbi-report-server-home.png)

## First things first
**The mobile apps are where you view Power BI content, not where you create it.**

* You and other report creators in your organization [create Power BI reports with Power BI Desktop, then publish them to the Power BI Report Server](report-server/reportserver-quickstart-powerbi-report.md) web portal. 
* You create [KPIs right in the web portal](https://docs.microsoft.com/sql/reporting-services/working-with-kpis-in-reporting-services), organize them in folders, and mark your favorites so you can find them easily. 
* You [create Reporting Services mobile reports](https://docs.microsoft.com/sql/reporting-services/mobile-reports/create-mobile-reports-with-sql-server-mobile-report-publisher) with SQL Server 2016 Enterprise Edition Mobile Report Publisher and publish them to the [Reporting Services web portal](https://docs.microsoft.com/sql/reporting-services/web-portal-ssrs-native-mode).  

Then in the Power BI mobile apps, connect to up to five report servers to view the Power BI reports and KPIs, organized in folders or collected as favorites. 

## Explore samples in the mobile apps without a server connection
Even if you don't have access to a Reporting Services web portal, you can still explore the features of Reporting Services mobile reports and KPIs. 

1. Tap the global navigation button ![Global navigation button](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-global-nav-button.png) in the upper-left corner, then tap the gear icon in the upper right ![Gear icon](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-settings-icon.png).
2. Tap **Reporting Services samples**, then browse to interact with the sample KPIs and mobile reports.
   
   ![Reporting Services samples](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-ssrs-samples.png)

## Connect to an on-premises server
You can view on-premises Power BI reports, Reporting Services mobile reports, and KPIs in the Power BI mobile apps. 

1. On your mobile device, open the Power BI app.
2. If you haven't signed in to Power BI yet, tap **Report Server**.
   
   ![Sign in to a report server](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-connect-to-rs-login.png)
   
   If you've already signed in to the Power BI app, tap the global navigation button ![Global navigation button](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-global-nav-button.png), then tap the gear icon ![Gear icon](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-settings-icon.png) in the upper-right.
3. Tap **Connect to server**.
   
    ![Connect to server](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-android-server-sign-in.png)
4. Fill in the server address and your user name and password. Use this format for the server address:
   
     `http://<servername>/reports`
   
     OR
   
     `https://<servername>/reports`
   
   > [!NOTE]
   > Include **http** or **https** in front of the connection string.
   > 
   > 
   
    ![COnnect to server dialog box](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-connect-to-server-dialog.png)
5. (Optional) Under **Advanced options**, you can give the server a friendly name, if you'd like.
6. Now you see the server in the left navigation bar--in this example, called "power bi report server."
   
   ![Report server in the left navigation pane](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-left-nav-report-server.png)

## View Power BI reports and KPIs in the Power BI app
Power BI reports, Reporting Services mobile reports, and KPIs are displayed in the same folders they're in on the Reporting Services web portal. 

* Tap a Power BI report ![Power BI report icon](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-rs-mobile-report-icon.png). It opens in landscape mode, and you can interact with it in the Power BI app.
  
    ![Power BI report](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-report-server-report.png)
* In Power BI Desktop, report owners can [optimize a report](powerbi-desktop-create-phone-report.md) for the Power BI mobile apps. On your mobile phone, optimized reports have a special icon, ![Optimized Power BI report icon](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-rs-mobile-optimized-icon.png), and layout.
  
    ![Power BI report optimized for mobile](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-rs-mobile-optimized-report.png)
* Tap a KPI to see it in focus mode.
  
    ![KPI in focus mode](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_SSMRP_Tile.png)

## View your favorite KPIs and reports
You can mark KPIs and reports as favorites on the web portal, and then view them in one convenient folder on your mobile device, along with your Power BI favorite dashboards.

* Tap **Favorites**.
  
   ![Favorites in the left navigation pane](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ipad-faves-pbi-report-server.png)
  
   Your favorite KPIs and reports from the web portal are all on this page, along with Power BI dashboards in the Power BI service:
  
   ![Power BI reports and dashboard in the Favorites page](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ipad-favorites.png)

## Remove a connection to a report server
1. At the bottom of the left navigation bar, tap **Settings**.
2. Tap the server name you don't want to be connected to.
3. Tap **Remove Server**.

## Next steps
* [Get started with Power BI](service-get-started.md)  
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)

