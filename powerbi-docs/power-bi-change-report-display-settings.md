---
title: Change the size of a report page (Tutorial)
description: 'Tutorial: Change the display settings for a page in a Power BI report'
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: modifying
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/25/2017
ms.author: mihart

---
# Change the size of a report page (Tutorial)
In the [previous article and video](power-bi-report-display-settings.md) you learned about two different ways to control page display in Power BI reports: **View** and **Page Size**. Now let's try it ourselves.

## First, let's change the page View setting
1. Open a report in Reading View or Editing View. This example uses the "New Stores" page of the [Retail Analysis sample](sample-retail-analysis.md).  This page is displayed using the **Fit to Page** setting.  In this case, Fit to Page displays the report page without scrollbars, but some of the detail and titles are too small to read.
   
   ![](media/power-bi-change-report-display-settings/pbi_fit_to_page.png)
2. Make sure that no visualizations are selected on the canvas. Select **View** and review the display options.

* In Reading view you'll see this.
  
     ![](media/power-bi-change-report-display-settings/power-bi-page-view-menu-new.png)
* In Editing view you'll see this.
  
    ![](media/power-bi-change-report-display-settings/power-bi-view-editing-view.png)

1. Let's see how the page looks using the **Actual size** setting.
   
   ![](media/power-bi-change-report-display-settings/power-bi-actal-size2.png)
   
   Not great, the dashboard now has double scrollbars.
2. Switch to **Fit to Width**.
   
   ![](media/power-bi-change-report-display-settings/pbi_fit_to_width.png)
   
   Looks better, we now have scrollbars but it's easier to read the detail.

## Change the default view for a report page
All Power BI reports default to **Fit to page** view. But what if you want this report page to always open in **Actual size** view?

1. On the **New stores** page of the report, switch back to **Actual size** view.
   
   ![](media/power-bi-change-report-display-settings/power-bi-actual-size.png)
2. Save the report with a different name by selecting **File > Save as**. You now have 2 copies of this report; in the original report, **New stores** will continue to open in the default view but in the new report it will open in **Actual size** view. Let's go see.
   
   ![](media/power-bi-change-report-display-settings/power-bi-save-as.png)
3. Select the name of the current workspace from the top navbar to return to that workspace.  
   
   ![](media/power-bi-change-report-display-settings/power-bi-my-workspace.png)
4. Select the **Reports** tab and choose the new report you just created (it will have a yellow asterisk).
   
    ![](media/power-bi-change-report-display-settings/power-bi-new-report2.png)
5. The report opens in **Actual size** view!
   
   ![](media/power-bi-change-report-display-settings/power-bi-actal-size2.png)

## Now, let's explore the *page size* setting
The page size settings are only available in [Editing view](service-interact-with-a-report-in-editing-view.md). To open a report in Editing view you must have owner permissions for the report. If you've connected to any of our [samples](sample-datasets.md), you'll have owner permissions to those reports.

1. Open the "District monthly sales" page of the [Retail Analysis sample](sample-retail-analysis.md) in Editing View.
2. Make sure that no visualizations are selected on the canvas.  In the **Visualizations** pane, select the paint roller icon ![](media/power-bi-change-report-display-settings/power-bi-paintroller.png).
3. Select **Page size** &gt; **Type** to display the page size options.
   
   ![](media/power-bi-change-report-display-settings/power-bi-page-size-menu-new.png)
4. Select **Letter**.  On the canvas, only the contents that fit within 816 x 1056 pixels (Letter size) remain on the white portion of the canvas.
   
   ![](media/power-bi-change-report-display-settings/power-bi-letter-new.png)
5. If we change **View** to "Fit to Width," our canvas now displays only the page contents that fit into the letter size.
   
   ![](media/power-bi-change-report-display-settings/power-bi-fit-to-width-new.png)
6. Select **Page size** **16:9** ratio.
   
   ![](media/power-bi-change-report-display-settings/power-bi-16-to-9-new.png)
   
   The report page displays using a ratio of 16 wide by 9 high. To see the actual pixel size being used, take a look at the greyed out Width and Height fields (1280x720). There is a lot of empty space around the report canvas; this is because we previously set **View** to "Fit to width".
7. Continue exploring the **Page Size** options.

## Using page View and Page Size together
Use page View and Page Size together to create a report that looks its best when embedded in another application.

In this exercise, you'll create a report page that will display in an application that has space for 500 pixels wide by 750 pixels high.

Remember in the previous step we saw that our report page is currently displaying at 1280 wide by 720 high. So we know that we'll need to do a lot of resizing and rearranging if we want all of our visuals to fit.

1. Resize and move the visuals so that they fit in less than half of the current canvas area.
   
    ![](media/power-bi-change-report-display-settings/power-bi-custom-view.gif)
2. Select **Page Size** &gt; **Custom**.
3. Set Width to 500 and set Height to 750.
   
    ![](media/power-bi-change-report-display-settings/power-bi-custom-new.png)
4. Tweak the report page so that it looks its best. Switch between **View > Actual size** and **View > Fit to page** to make adjustments.
   
    ![](media/power-bi-change-report-display-settings/power-bi-final-new.png)

## Next steps
[Create reports for Cortana](service-cortana-answer-cards.md)

Back to [Page display settings in a Power BI report](power-bi-report-display-settings.md)

Read more about  [reports in Power BI ](service-reports.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

