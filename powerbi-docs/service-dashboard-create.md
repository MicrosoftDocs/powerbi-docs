---
title: Create a Power BI dashboard from a report
description: Create a Power BI dashboard from a report
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
featuredvideoid: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 07/17/2019
ms.author: maggies

---
# Create a Power BI dashboard from a report
You've read [Introduction to dashboards in Power BI](service-dashboards.md), and now you want to create your own. There are many different ways to create a dashboard. For example, you can create a dashboard from a report, from scratch, from a dataset, or by duplicating an existing dashboard.  

Because it can seem overwhelming when you're first getting started, we'll start by creating a quick and easy dashboard that pins visualizations from a report that's already been built. 

After you complete this quickstart, you'll have a good understanding of:
- The relationship between dashboards and reports
- How to open Editing view in the report editor
- How to pin tiles 
- How to navigate between a dashboard and a report 

## Who can create a dashboard?
The ability to create a dashboard is considered a *creator* feature and requires edit permissions on the report. Edit permissions are available to report creators and to those colleagues the creator grants access. For example, if David creates a report in workspaceABC and then adds you as a member of that workspace, you and David will both have edit permissions. On the other hand, if a report has been shared with you directly or as part of a [Power BI app](service-create-distribute-apps.md) (you're *consuming* the report), you won't be able to pin tiles to a dashboard.
 
![Dashboard](media/service-dashboard-create/power-bi-completed-dashboard-small.png)

> [!NOTE] 
> Dashboards are a feature of the Power BI service, not Power BI Desktop. Although dashboards can't be created in Power BI mobile, they can be [viewed and shared](consumer/mobile/mobile-apps-view-dashboard.md) there.
>
> 

## Video: Create a dashboard by pinning visuals and images from a report
Watch Amanda create a new dashboard by pinning visualizations from a report. Then, follow the steps in [Import a dataset with a report](#import-a-dataset-with-a-report) to try it out yourself, by using the Procurement Analysis sample.
    

<iframe width="560" height="315" src="https://www.youtube.com/embed/lJKgWnvl6bQ" frameborder="0" allowfullscreen></iframe>

## Import a dataset with a report
We'll import one of the Power BI sample datasets and use it to create our new dashboard. The sample we'll use is an Excel workbook with two PowerView sheets. When Power BI imports the workbook, it adds a dataset and a report to your workspace. The report is automatically created from the PowerView sheets.

1. Download the Procurement Analysis sample [Excel file](http://go.microsoft.com/fwlink/?LinkId=529784). We recommend saving it in your OneDrive for Business.
2. Open the Power BI service in your browser (app.powerbi.com).
3. From the left navigation pane, select **My Workspace** and then select **Get Data**.

    ![Left navigation pane](media/service-dashboard-create/power-bi-get-data3.png)
5. Select **Files**.

   ![Get files](media/service-dashboard-create/power-bi-select-files.png)
6. Navigate to the location where you saved the Procurement Analysis sample Excel file. Select it and choose **Connect**.

   ![Connect to files](media/service-dashboard-create/power-bi-connectnew.png)
7. For this exercise, select **Import**.

    ![OneDrive for Business window](media/service-dashboard-create/power-bi-import.png)
8. When the success message appears, select the **x** to dismiss it.

   ![Success message](media/service-dashboard-create/power-bi-view-datasetnew.png)

### Open the report and pin tiles to your dashboard
1. In the same workspace, select the **Reports** tab, and then select **Procurement Analysis Sample** to open the report.

    ![Reports tab](media/service-dashboard-create/power-bi-reports.png)
    The report opens in Reading view. Notice it has two tabs at the bottom: **Discount Analysis** and **Spend Overview**. Each tab represents a page of the report.

2. Select **Edit report** to open the report in Editing view.

    ![Report in Reading view](media/service-dashboard-create/power-bi-reading-view.png)
3. Hover over a visualization to reveal the options available. To add a visualization to a dashboard, select the pin icon ![Pin icon](media/service-dashboard-create/power-bi-pin-icon.png).

    ![Hover over tile](media/service-dashboard-create/power-bi-hover.png)
4. Because we're creating a new dashboard, select the option for **New dashboard** and give it a name.

    ![Pin to dashboard dialog](media/service-dashboard-create/power-bi-pin-tile.png)
5. When you select **Pin**, Power BI creates the new dashboard in the current workspace. After the **Pinned to dashboard** message appears, select **Go to dashboard**. If you're prompted to save the report, choose **Save**.

    ![Success message](media/service-dashboard-create/power-bi-pin-success.png)

    Power BI opens the new dashboard. It has one tile: the visualization you just pinned.

   ![dashboard with one tile](media/service-dashboard-create/power-bi-pinned.png)
7. Select the tile to return to the report. Pin a few more tiles to the new dashboard. When the **Pin to dashboard** window displays, select **Existing dashboard**.  

   ![Pin to dashboard dialog](media/service-dashboard-create/power-bi-existing-dashboard.png)

## Pin an entire report page to the dashboard
Instead of pinning one visual at a time, you can [pin an entire report page as a *live tile*](service-dashboard-pin-live-tile-from-report.md). Let's do it.

1. In the report editor, select the **Spend Overview** tab to open the second page of the report.

   ![Report tab](media/service-dashboard-create/power-bi-page-tab.png)

2. We want all of the visuals in the report on your dashboard. In the upper-right corner of the menubar, select **Pin live page**. On a dashboard, live page tiles update each time the page is refreshed.

   ![Upper right of report editor](media/service-dashboard-create/power-bi-pin-live.png)

3. When the **Pin to dashboard** window appears, select **Existing dashboard**.

   ![Pin to dashboard dialog](media/service-dashboard-create/power-bi-pin-live2.png)

4. After the Success message appears, select **Go to dashboard**. There you'll see the tiles you pinned from the report. In the example below, we've pinned two tiles from page one of the report and one live tile, which is page two of the report.

   ![Dashboard](media/service-dashboard-create/power-bi-dashboard.png)

## Next steps
Congratulations on creating your first dashboard! Now that you have a dashboard, there's much more you can do with it. Follow one of the suggested articles below, or start exploring on your own: 

* [Resize and move tiles](service-dashboard-edit-tile.md)
* [All about dashboard tiles](service-dashboard-tiles.md)
* [Share your dashboard by creating an app](service-create-workspaces.md)
* [Power BI - Basic Concepts](service-basic-concepts.md)
* [Tips for designing a great dashboard](service-dashboards-design-tips.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/).
