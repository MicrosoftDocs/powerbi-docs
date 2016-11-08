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
   ms.date="11/07/2016"
   ms.author="maggies"/>

# Create a deep link that goes to a specific location in the Power BI mobile apps

You can create and use a uniform resource identifier (URI) to link to a specific location (a *deep link*) within the Power BI mobile apps on all the mobile platforms: iOS, Android devices, and Windows 10.

URI links can point directly to tiles, dashboards, and reports.

The destination of the deep link determines the format of the URI. Follow these steps to create deep links to different locations. 

## To open the Power BI mobile app

Use this URI to open the Power BI mobile app on any device:

    mspbi://app/

## Open a dashboard

This URI opens the Power BI mobile app to a specific dashboard:

    mspbi://app/OpenDashboard?DashboardObjectId=<36-character-dashboard-id>

To find the 36-character dashboard object id, navigate to the specific dashboard in the Power BI service (https://powerbi.com). For example, see the highlighted section of this URL:

https://powerbi.com/groups/me/dashboards/**61b7e871-cb98-48ed-bddc-6572c921e270**

If the dashboard is in a group other than My Workspace, just add `&GroupObjectId=<36-character-group-id>`

## Open the Power BI mobile app to a specific tile in focus

This URI opens a specific tile in focus in the Power BI mobile app:

    mspbi://app/OpenTile?DashboardObjectId=????&TileObjectId=<36-character-dashboard-id>????

To find the 36-character dashboard object id, navigate to the specific dashboard in the Power BI service (https://powerbi.com). For example, see the highlighted section of this URL:

If the dashboard is in a group other than My Workspace, just add `&GroupObjectId=<36-character-group-id>`



## Open the Power BI mobile app to a specific report

This URI opens a specific report in the Power BI mobile app:

    mspbi://app/OpenReport?ReportObjectId=<36-character-report-id>

To find the 36-character report object id, navigate to the specific report in the Power BI service (https://powerbi.com). For example, see the highlighted section of this URL:

https://powerbi.com/groups/me/reports/**df9f0e94-31df-450b-b97f-4461a7e4d300**

## Open the Power BI mobile app to a specific report page

This URI opens a specific report page in the Power BI mobile app:

    mspbi://app/OpenReport?ReportObjectId=/ReportSection11

The report page is called "ReportSection" followed by a number. Again, open the report in the Power BI service (https://powerbi.com) and navigate to the specific report page. 

For example, see the highlighted section of this URL:

https://powerbi.com/groups/me/reports/df9f0e94-31df-450b-b97f-4461a7e4d300/**ReportSection11**


## Open the Power BI mobile app to a specific group



## See also

Your feedback helps us decide what to implement in the future, so don’t forget to vote for other features you'd like to see in Power BI mobile apps. 

-   [Power BI apps for mobile devices](powerbi-power-bi-apps-for-mobile-devices.md)
-   Follow @MSPowerBI on Twitter
-   Join the conversation at the [Power BI Community](http://community.powerbi.com/)
-   [Get started with Power BI](powerbi-service-get-started.md)

