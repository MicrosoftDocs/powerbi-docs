<properties 
   pageTitle="View SSRS mobile reports and KPIs in the iOS mobile apps"
   description="The Power BI mobile app for iOS offers live, touch-enabled mobile access to your important on-premises business information."
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
   ms.date="02/21/2017"
   ms.author="maggies"/>

# View SSRS mobile reports and KPIs in the iOS mobile apps

The Power BI mobile app for iPad and iPhone offers live, touch-enabled mobile access to your important on-premises business information in SQL Server 2016 Reporting Services. 

 ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_SSMRP_MobRpt.png)

## First things first

-  You [create Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx) with SQL Server 2016 Enterprise Edition Mobile Report Publisher and publish them to the [Reporting Services web portal](https://msdn.microsoft.com/library/mt637133.aspx). You can even [create a special mobile report layout for phones](https://msdn.microsoft.com/library/mt703702.aspx). 
-   You can also create KPIs right in the web portal, and organize them all in folders and mark your favorites, so you can find them easily. 

Then in the Power BI mobile app for iOS, view the mobile reports and KPIs, organized in folders or collected as favorites. 

>**Note**: Your iPhone needs to be at least an iPhone 5. Both iPhones and iPads need to be running at least iOS 9.0.

## Explore samples without an SSRS server

Even if you don't have access to a Reporting Services web portal, you can still explore the features of Reporting Services mobile reports. 

1. Tap the global navigation button ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-global-nav-button.png) in the upper-left corner, scroll down and tap **Reporting Services samples**.

2.  Browse to interact with the sample KPIs and mobile reports.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-ssrs-samples.png)

## Connect to a server to view Reporting Services mobile reports 

1.  In your iPhone or iPad, open the Power BI app.

2.  If you haven't signed in to Power BI yet, tap **SQL Server Reporting Services**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-connect-ssrs-server.png)

2.  If you've already signed in to the Power BI app, tap the global navigation button ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-global-nav-button.png), then tap the **Settings** icon ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-settings-icon.png).

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-settings.png)

    Tap **Connect to server**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-connect-to-ssrs-server.png)

4. Fill in the server address and your user name and password. Use this format for the server address:

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-connect-to-server-dialog.png)

     `http://<servername>/reports`
     OR
     `https://<servername>/reports`
     
     >**Note**: Include **http** or **https** in front of the connection string.

5.    (Optional) Under **Advanced options**, you can give the server a name, if you'd like.

5.  Now you see the server in the left navigation bar--in this example, called "work server."

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-ssrs-server.png)

>**Tip**: Tap the global navigation button ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-iphone-global-nav-button.png) anytime to go between your Reporting Services mobile reports and your dashboards in the Power BI service. 

## View Reporting Services KPIs and mobile reports in the Power BI app

Reporting Services KPIs and mobile reports are displayed in the same folders they're in on the Reporting Services web portal. 

- Tap a KPI to see it in focus mode.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_SSMRP_Tile.png)

- Tap a mobile report to open and interact with it in the Power BI app.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPh_SSMRP_MobRpt.png)

## View your favorite KPIs and reports

You can mark KPIs and mobile reports as favorites on your Reporting Services web portal, and then view them in one convenient folder on your iPhone, along with your Power BI favorite dashboards and reports.

-  Tap **Favorites**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ios-favorites.png)
   
    Your favorites from the web portal are all on this page.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/power-bi-ipad-favorites-page.png)

## Remove a connection to a report server

You can only be connected to one report server at a time from your iPhone app. If you want to connect to a different server, you need to disconnect from the current one.

1. At the bottom of the left navigation bar, tap **Settings**.
2. Tap the server name you don't want to be connected to.
3. Tap **Remove Server**.

## Create Reporting Services mobile reports and KPIs

You don't create Reporting Services KPIs and mobile reports in the Power BI mobile app. You create them in SQL Server 2016 Enterprise Edition Mobile Report Publisher and a SQL Server 2016 Reporting Services web portal.

- [Create your own Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx) and publish them to the Reporting Services web portal.
- [Create a special mobile report layout for phones](https://msdn.microsoft.com/library/mt703702.aspx).
- Create [KPIs on the Reporting Services web portal](https://msdn.microsoft.com/library/mt683632.aspx)

### See also  
- [Get started with the iPhone app for Power BI](powerbi-mobile-iphone-app-get-started.md) 
- [Get started with the iPad app for Power BI](powerbi-mobile-ipad-app-get-started.md) 
- [Get started with Power BI](powerbi-service-get-started.md)  
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)