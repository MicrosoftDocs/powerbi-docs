<properties 
   pageTitle="View Reporting Services mobile reports and KPIs in the iPhone app"
   description="The iPhone app (Power BI for iOS) offers live, touch-enabled mobile access to your important on-premises business information."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
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
   ms.date="09/26/2016"
   ms.author="maggies"/>

# View Reporting Services mobile reports and KPIs in the iPhone app (Power BI for iOS)  

The iPhone app for Microsoft Power BI for iOS offers live, touch-enabled mobile access to your important on-premises business information. 

![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_iph_ssmrp_tallhomeblc.png)

[Create Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx) with SQL Server Mobile Report Publisher and publish them to the [Reporting Services web portal](https://msdn.microsoft.com/library/mt637133.aspx). Create KPIs right in the web portal. Organize them in folders and mark your favorites, so you can find them easily. 

Then in the iPhone app for Power BI, view the mobile reports and KPIs, organized in folders or collected as favorites. 

>**Note**: Your iPhone needs to be at least an iPhone 5, running at least iOS 8.0.

## Explore samples without an SSRS server

Even if you don't have access to a Reporting Services web portal, you can still explore the features of Reporting Services mobile reports. 

-  Tap the options icon ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_OptionsIcon.png) in the upper-left corner, scroll down and tap 
-  SQL Server RS Samples.

Browse the samples to interact with KPIs and mobile reports.


## Connect to a server to view Reporting Services mobile reports 

1.  In the iPhone, open the Power BI app.
  
2.  To view your Reporting Services mobile reports and KPIs, tap **Reporting Services**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_ipad_getstarted.png)

3. Tap the options icon ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_OptionsIcon.png) in the upper-left corner, and tap **Connect**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_iph_sample.png)

4. Fill in the server address and your user name and password.

    >**Note**: Include **http** or **https** in front of the connection string. For example, http://*servername*.com/reports.

    Tap **Advanced option** to give the server a name, if you'd like.

5.  Now you see the server in the left navigation bar.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_iph_ssmrp_homelc.png)

>**Tip**: Tap the options icon ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPad_OptionsIcon.png) anytime to go between your Reporting Services mobile reports and your dashboards in the Power BI service. 

## View Reporting Services KPIs and mobile reports in the Power BI app

Reporting Services KPIs and mobile reports are displayed in the same folders they're in on the Reporting Services web portal. 

- Tap a KPI to see it in focus mode.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPh_SSMRP_Tile.png)

- Tap a mobile report to open and interact with it in the Power BI app.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/PBI_iPh_SSMRP_MobRpt.png)

## View your favorite KPIs and reports

You can mark KPIs and mobile reports as favorites on your Reporting Services web portal, and then view them in one convenient folder on your iPhone, along with your Power BI favorite dashboards and reports.

-  Tap **Favorites**.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_and_ssrs_favemenu.png)
   
    Your favorites from the web portal are all on this page.

    ![](media/powerbi-mobile-iphone-kpis-mobile-reports/pbi_and_ssrs_favepage.png)

## Remove a connection to a report server

You can only be connected to one report server at a time from your iPhone app. If you want to connect to a different server, you need to disconnect from the current one.

1. At the bottom of the left navigation bar, tap **Settings**.
2. Tap the server name you don't want to be connected to.
3. Tap **Remove Connection**.

## Create Reporting Services mobile reports and KPIs

You don't create Reporting Services KPIs and mobile reports in the Power BI mobile app. You create them in SQL Server Mobile Report Publisher and a SQL Server 2016 Reporting Services web portal.

- [Create your own Reporting Services mobile reports](https://msdn.microsoft.com/library/mt652547.aspx), and publish them to the Reporting Services web portal.
- Create [KPIs on the Reporting Services web portal](https://msdn.microsoft.com/library/mt683632.aspx)

### See also  
- [Get started with the iPhone app for Power BI](powerbi-mobile-iphone-app-get-started.md)  
- [Get started with Power BI](powerbi-service-get-started.md)  
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)