---
title: Create a Power BI dashboard from a report
description: Create a Power BI dashboard from a report
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
featuredvideoid: ''
qualityfocus: ''
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 05/09/2017
ms.author: mihart

---
# Create a Power BI dashboard from a report
You've read [Dashboards in Power BI](service-dashboards.md), and now you want to create your own. There are many different ways to create a dashboard - from a report, from scratch, from a dataset, by duplicating an existing dashboard, and more.  This topic and video show you how to create a new dashboard by pinning visualizations from an existing report.

> **NOTE**: Dashboards are a feature of Power BI service, not Power BI Desktop. Dashboards can't be created in Power BI mobile, but they can be [viewed and shared](mobile-apps-view-dashboard.md).
> 
> 

![](media/service-dashboard-create/power-bi-completed-dashboard-small.png)

## Video: Create a dashboard by pinning visuals and images from a report
Watch Amanda create a new dashboard by pinning visualizations from a report. Then try it out yourself, using the Procurement Analysis sample, by following the steps below the video.

<iframe width="560" height="315" src="https://www.youtube.com/embed/lJKgWnvl6bQ" frameborder="0" allowfullscreen></iframe>

## Import a dataset with a report
We'll import one of the Power BI sample datasets and use it to create our new dashboard. The sample we'll use is an Excel workbook with two PowerView sheets. When Power BI imports the workbook it will add a dataset and also a report to your workspace.  The report is automatically created from the PowerView sheets.

1. [Select this link](http://go.microsoft.com/fwlink/?LinkId=529784) to download and save the Procurement Analysis sample Excel file. We recommend saving it in your OneDrive for Business.
2. Open Power BI service in your browser (app.powerbi.com).
3. Select an existing workspace or create a new app workspace.
4. From the left nav, select **Get Data**.
   
    ![](media/service-dashboard-create/power-bi-get-data3.png)
5. Select **Files**.
   
   ![](media/service-dashboard-create/power-bi-select-files.png)
6. Navigate to the location where you saved the Procurement Analysis sample Excel file. Select it and choose **Connect**.
   
   ![](media/service-dashboard-create/power-bi-connectnew.png)
7. For this exercise, select **Import**.
   
    ![](media/service-dashboard-create/power-bi-import.png)
8. When the Success message appears, select the **x** to close it.
   
   ![](media/service-dashboard-create/power-bi-view-datasetnew.png)

### Open the report and pin some tiles to a dashboard
1. Staying in the same workspace, select the **Reports** tab. The newly-imported report displays with a yellow asterisk. Select the report name to open it.
   
    ![](media/service-dashboard-create/power-bi-reports.png)
2. The report opens in [Reading view](service-reading-view-and-editing-view.md). Notice it has two tabs at the bottom: Discount Analysis and Spend Overview. Each tab represents a page of the report.
   
    ![](media/service-dashboard-create/power-bi-reading-view.png)
3. Hover over a visualization to reveal the options available. To add a visualization to a dashboard, select the pin ![](media/service-dashboard-create/power-bi-pin-icon.png) icon.
   
    ![](media/service-dashboard-create/power-bi-hover.png)
4. Since we're creating a new dashboard, select the option for **New dashboard** and give it a name. 
   
   ![](media/service-dashboard-create/power-bi-pin-tile.png)
5. When you select **Pin**, Power BI creates the new dashboard in the current workspace. When the **Pinned to dashboard** message appears, select **Go to dashboard**. If you're prompted to save the report, choose **Save**.
   
     ![](media/service-dashboard-create/power-bi-pin-success.png)
6. Power BI opens the new dashboard and there is one tile - the visualization we just pinned. 
   
   ![](media/service-dashboard-create/power-bi-pinned.png)
7. To return to the report, select the tile. Pin a few more tiles to the new dashboard. This time when the **Pin to dashboard** window displays, select **Existing dashboard**.  
   
   ![](media/service-dashboard-create/power-bi-existing-dashboard.png)

Congratulations on creating your first dashboard! Now that you have a dashboard, there's so much more you can do with it.  Try one of the suggested **Next steps** below, or start playing and exploring on your own.   

## Next steps
* [Resize and move tiles](service-dashboard-edit-tile.md)
* [All about dashboard tiles](service-dashboard-tiles.md)
* [Share your dashboard by creating an app](service-create-distribute-apps.md)
* [Power BI - Basic Concepts](service-basic-concepts.md)
* [Dashboards in Power BI](service-dashboards.md)
* [Tips for designing a great dashboard](service-dashboards-design-tips.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

