---
title: Change the size of a report page
description: 'Change the display settings for a page in a Power BI report'
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/24/2018
ms.author: mihart

LocalizationGroup: Reports
---
# Change the size of a report page
In the [previous article and video](../power-bi-report-display-settings.md) you learned about two different ways to control page display in Power BI reports: **View** and **Page Size**. Page view and Page Size are available in both Power BI service and Power BI Desktop, and look and function amost the same, but for this tutorial we're using Power BI service.

### Prerequisites
- Power BI service   
- [Retail Analysis Sample report](../sample-retail-analysis.md)

## First, let's change the page View setting

1. Open the report in Reading View or Editing View and select the report tab for **New Stores**. By default, this report page is displayed using the **Fit to Page** setting.  In this case, Fit to Page displays the report page without scrollbars, but some of the detail and titles are too small to read.

   ![](media/end-user-report-view/pbi_fit_to_page.png)
2. Make sure that no visualizations are selected on the canvas. Select **View** and review the display options.

   * In Reading view you'll see this.

     ![](media/end-user-report-view/power-bi-page-view-menu-new.png)
   * In Editing view you'll see this.

     ![](media/end-user-report-view/power-bi-view-editing-view.png)

3. Let's see how the page looks using the **Actual size** setting.

   ![](media/end-user-report-view/power-bi-actal-size2.png)

   Not great, the dashboard now has double scrollbars.
4. Switch to **Fit to Width**.

   ![](media/end-user-report-view/pbi_fit_to_width.png)

   Looks better, we now have scrollbars but it's easier to read the detail.

## Change the default view for a report page
If you're a report *creator*, you can change the default view for your report pages. When you share your report with others, the report pages will open using the view you've set. Report *consumers* will be able to change the view, but won't be able to save their changes once they exit out of the report.

1. On the **New stores** page of the report, switch back to **Actual size** view.

   ![](media/end-user-report-view/power-bi-actual-size.png)

2. On the **District Monthly Sales** report page, set View to **Fit to width**.

3. On the **Overview** report page, leave the default View setting.

4. Now save the report by selecting **File > Save**. The next time you open this report, the pages will display using the new View settings. Let's go see.

   ![](media/end-user-report-view/power-bi-save.png)
3. Select the name of the current workspace from the top navbar to return to that workspace.  

   ![](media/end-user-report-view/power-bi-my-workspace.png)
4. Select the **Reports** tab and choose the same report (Retail Analysis Sample).

    ![](media/end-user-report-view/power-bi-new-report2.png)
5. Open each page of the report to see the new settings.

   ![](media/end-user-report-view/power-bi-page-view.gif)

## Now, let's explore the *page size* setting
The page size settings are only available in [Editing view](../service-interact-with-a-report-in-editing-view.md), so you must have edit (*creator*) permissions to the report to change the page size settings. If you've connected to any of our [samples](../sample-datasets.md), you'll have *creator* permissions to those reports.

1. Open the "District monthly sales" page of the [Retail Analysis sample](../sample-retail-analysis.md) in Editing View.
2. Make sure that no visualizations are selected on the canvas.  In the **Visualizations** pane, select the paint roller icon ![](media/end-user-report-view/power-bi-paintroller.png).
3. Select **Page size** &gt; **Type** to display the page size options.

   ![](media/end-user-report-view/power-bi-page-size-menu-new.png)
4. Select **Letter**.  On the canvas, only the contents that fit within 816 x 1056 pixels (Letter size) remain on the white portion of the canvas.

   ![](media/end-user-report-view/power-bi-letter-new.png)
5. Select **Page size** **16:9** ratio.

   ![](media/end-user-report-view/power-bi-16-to-9-new.png)

   The report page displays using a ratio of 16 wide by 9 high. To see the actual pixel size being used, take a look at the greyed out Width and Height fields (1280x720). There is a lot of empty space around the report canvas; this is because we previously set **View** to "Fit to width".
7. Continue exploring the **Page Size** options.

## Use page View and Page Size together
Use page View and Page Size together to create a report that looks its best when shared with colleagues or embedded in another application.

In this exercise, you'll create a report page that will display in an application that has space for 500 pixels wide by 750 pixels high.

Remember in the previous step we saw that our report page is currently displaying at 1280 wide by 720 high. So we know that we'll need to do a lot of resizing and rearranging if we want all of our visuals to fit.

1. Resize and move the visuals so that they fit in less than half of the current canvas area.

    ![](media/end-user-report-view/power-bi-custom-view.gif)
2. Select **Page Size** &gt; **Custom**.
3. Set Width to 500 and set Height to 750.

    ![](media/end-user-report-view/power-bi-custom-new.png)
4. Tweak the report page so that it looks its best. Switch between **View > Actual size** and **View > Fit to page** to make adjustments.

    ![](media/end-user-report-view/power-bi-final-new.png)

## Next steps
[Create reports for Cortana](../service-cortana-answer-cards.md)

Back to [Page display settings in a Power BI report](../power-bi-report-display-settings.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
