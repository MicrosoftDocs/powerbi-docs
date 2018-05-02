---
title: Report View in Power BI Desktop
description: Report View in Power BI Desktop
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
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
ms.date: 05/02/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Report View in Power BI Desktop
If you’ve been working with Power BI, you know how easy it is to create reports providing dynamic perspectives and insights into your data. Power BI also has more advanced features in Power BI Desktop. With Power BI Desktop, you can create advanced queries, mashup data from multiple sources, create relationships between tables, and more.

Power BI Desktop includes **Report View**, where you can create any number of report pages with visualizations. Report View in provides pretty much the same design experience as a report’s Editing View in the Power BI service. You can move visualizations around, copy and paste, merge, and so on.

The difference between them is when using Power BI Desktop, you can work with your queries and model your data to make sure your data supports the best insights in your reports. You can then save your Power BI Desktop file wherever you like, whether it's your local drive or to the cloud.

## Let's take a look!
When you first load data in Power BI Desktop, you’ll see **Report View** with a blank canvas.

![](media/desktop-report-view/pbi_reportviewinpbidesigner_reportview.png)

You can switch between **Report View**, **Data View**, and **Relationship View** by selecting the icons in the left-hand navigation bar:

![](media/desktop-report-view/pbi_reportviewinpbidesigner_changeview.png)

Once you’ve added some data, you can add fields to a new visualization in the canvas.

![](media/desktop-report-view/pbid_reportview_addvis.gif)

To change the type of visualization, you can select it from the **Visualization** group in the ribbon or you can right-click and select a different type from the **Change visualization type** icon.

![](media/desktop-report-view/pbid_reportview_changevis.gif)

> [!TIP]
> Be sure to experiment with different visualization types. It’s important your visualization convey information in your data clearly.
> 
> 

A report will have at least one blank page to start. Pages appear in the navigator pane just to the left of the canvas. You can add all sorts of visualizations to a page, but it's important not to overdo it. Too many visualizations on a page will make it look busy and difficult to find the right information. You can add new pages to your report. Just click **New Page** on the ribbon.

![](media/desktop-report-view/pbidesignerreportviewnewpage.png)

To delete a page, click the **X** on the page's tab at the bottom of the Report View.

![](media/desktop-report-view/pbi_reportviewinpbidesigner_deletepage.png)

> [!NOTE]
> Reports and visualizations can’t be pinned to a dashboard from Power BI Desktop. To do that, you’ll need to [Publish from Power BI Desktop](desktop-upload-desktop-files.md) to your  Power BI site.

## Hide report pages

When you create a report, you can also hide pages from a report. This might be useful if you need to create underlying data or visuals in a report, but you don't want those pages to be visible to others, such as when you create tables or supporting visuals that are used in other report pages. There are many other creative reasons you might want to create a report page, then hide it from a report you want to publish. 

Hiding a report page is easy. Simply right-click on the report page tab, and select **Hide** from the menu that appears.

![](media/desktop-report-view/report-view_05.png)

There are a few considerations to keep in mind when hiding a report page:

* You can still see a hidden report view when in **Power BI Desktop**, even though the page's title is grayed out. In the following image, Page 4 is hidden.

    ![](media/desktop-report-view/report-view_06.png)

* You *cannot* see a hidden report page when viewing the report in the **Power BI service**.

* Hiding a report page is *not* a security measure. The page can still be accessed by users, and its content is still accessible using drill-through, and other methods.

* When a page is hidden, when in View Mode, no view-mode navigation arrows are shown.

