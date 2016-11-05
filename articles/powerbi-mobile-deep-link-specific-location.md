<properties 
   pageTitle="Create a link that goes to a specific location in the Power BI mobile apps"
   description="Learn how to create a deep link to a specific tile, dashboard, or report in the Power BI mobile app with a uniform resource identifier (URI)."
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
   ms.date="11/04/2016"
   ms.author="maggies"/>

# Create a deep link that goes to a specific location in the Power BI mobile apps

You can now create and use a uniform resource identifier (URI) to link to a specific location within the Power BI mobile app on all the mobile platforms: iOS, Android devices, and Windows 10.

URI links can point directly to tiles, dashboards, and reports.

To create the deep-link you should follow this guidelines:

## To open the app

Use this URI:


    mspbi://app/

## To open a report


    mspbi://app/OpenReport?ReportObjectId=<36-character-object-id>

The report object id can be found in the PowerBI.com website in the website url when you navigate to the specific report. See the highlighted:

## To open a report page
    mspbi://app/OpenReport?ReportObjectId=????&reportPage=????

## To open a dashboard


    mspbi://app/OpenDashboard?DashboardObjectId=????

## To open an in-focus tile


    mspbi://app/OpenTile?DashboardObjectId=????&TileObjectId=????


If the dashboard is not in My Workspace but rather in another group, just add `&GroupObjectId=????`


## See also

Your feedback helps us decide what to implement in the future, so don’t forget to vote for other features you'd like to see in Power BI mobile apps. 

-   [Power BI apps for mobile devices](powerbi-power-bi-apps-for-mobile-devices.md)
-   Follow @MSPowerBI on Twitter
-   Join the conversation at the [Power BI Community](http://community.powerbi.com/)
-   [Get started with Power BI](powerbi-service-get-started.md)

