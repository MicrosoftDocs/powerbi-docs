<properties 
   pageTitle="View Reporting Services mobile reports and KPIs in the Power BI mobile app for Android tablets"
   description="Learn how the Power BI mobile app for Android tablets offers live, touch-enabled mobile access to your important on-premises business information."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="erikre" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/29/2016"
   ms.author="maggies"/>

# View Reporting Services mobile reports and KPIs in the Power BI mobile app for Android tablets 
The Power BI mobile app for Android tablets offers live, touch-enabled mobile access to your important on-premises business information. 

![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/power-bi-android-tablet-ssrs-home.png)

First things first:

-  You [create Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx) with SQL Server 2016 Enterprise Edition Mobile Report Publisher and publish them to the [Reporting Services web portal](https://msdn.microsoft.com/library/mt637133.aspx). You can even [create a special mobile report layout for tablets](https://msdn.microsoft.com/library/mt703702.aspx). 
-   You can also create KPIs right in the web portal, and organize them all in folders and mark your favorites, so you can find them easily. 

Then in the Android app for Power BI, view the mobile reports and KPIs, organized in folders or collected as favorites. 

## Explore samples without an SSRS server

Even if you don't have access to a Reporting Services web portal, you can still explore the features of Reporting Services mobile reports. 

-  Tap the options icon ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/pbi_and_menuiconbordr.png) in the upper-left corner, scroll down and tap SQL Server RS Samples.

Browse the samples to interact with KPIs and mobile reports.

## Connect to a server to view Reporting Services mobile reports 

1.  In your Android tablet, open the Power BI app.
  
3. Tap the options icon ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/pbi_and_menuiconbordr.png) in the upper-left corner, and tap **Connect to SSRS server**.

4. Fill in the server address and your user name and password. Use this format for the server address:

     `http://<servername>/reports`

     Or

     `https://<servername>/reports`
     
     >**Note**: Include **http** or **https** in front of the connection string.

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/pbi_ssrs_and_connect.png)


    Tap **Advanced option** to give the server a name, if you'd like.

3. Tap the check mark in the upper-right corner.

5.  Now you see the server in the left navigation bar.

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/pbi_ssrs_server.png)

>**Tip**: Tap the options icon ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/pbi_and_menuiconbordr.png) anytime to go between your Reporting Services mobile reports and your dashboards in the Power BI service. 

## View Reporting Services KPIs and mobile reports in the Power BI app

Reporting Services KPIs and mobile reports are displayed in the same folders they're in on the Reporting Services web portal. 

- Tap a KPI to see it in focus mode. (Tip your tablet to see it in landscape mode.)

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/power-bi-android-tablet-ssrs-kpi.png)

- Tap a mobile report to open and interact with it in the Power BI app.

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/power-bi-android-tablet-ssrs-sample-report.png)

## View your favorite KPIs and reports

You can mark KPIs and mobile reports as favorites on your Reporting Services web portal, and then view them in one convenient folder on your tablet, along with your Power BI favorite dashboards and reports.

-  Tap **Favorites**.

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/power-bi-android-tablet-left-nav-favorites.png)
   
    Your favorites from the web portal are all on this page.

    ![](media/powerbi-mobile-android-tablet-kpis-mobile-reports/power-bi-android-tablet-ssrs-favorites.png)

## Remove a connection to a report server

You can only be connected to one report server at a time from your Android app. If you want to connect to a different server, you need to disconnect from the current one.

1. At the bottom of the left navigation bar, tap **Settings**.
2. Tap the ellipsis (**...**) next to the server name you don't want to be connected to.
3. Tap **Remove Connection**.


## Create Reporting Services mobile reports and KPIs

You don't create Reporting Services KPIs and mobile reports in the Power BI mobile app. You create them in SQL Server 2016 Enterprise Edition Mobile Report Publisher and a SQL Server 2016 Reporting Services web portal.

- [Create your own Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx) and publish them to the Reporting Services web portal.
- [Create a special mobile report layout for tablets](https://msdn.microsoft.com/library/mt703702.aspx).
- Create [KPIs on the Reporting Services web portal](https://msdn.microsoft.com/library/mt683632.aspx)

## See also  
- [Get started with the Android app for Power BI](powerbi-mobile-android-tablet-app-get-started.md)  
- [Get started with Power BI](powerbi-service-get-started.md)  
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
