---
title: "Tutorial: Get started creating in the Power BI service"
description: Get started with the Power BI online service (app.powerbi.com)
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 06/21/2021
Customer intent: As a Power BI customer or potential customer, I want to try it out for free and see how quick and intuitive it is so that I'll want to use it again and often, talk about it to colleagues and influence purchase and trial by others.  
LocalizationGroup: Get started
---

# Tutorial: Get started creating in the Power BI service

This tutorial is an introduction to some of the features of the *Power BI service*. In it, you connect to data, create a report and a dashboard, and ask questions of your data. You can do much more in the Power BI service; this tutorial is just to whet your appetite. For an understanding of how the Power BI service fits in with the other Power BI offerings, we recommend reading [What is Power BI](power-bi-overview.md).

Are you a report *reader* rather than a creator? [Getting around in the Power BI service](../consumer/end-user-experience.md) is a good starting place for you.

:::image type="content" source="media/service-get-started/power-bi-service-rearranged-dashboard.png" alt-text="Screenshot of Financial Sample dashboard.":::

In this tutorial, you complete the following steps:

> [!div class="checklist"]
> * Sign in to your Power BI online account, or sign up, if you don't have an account yet.
> * Open the Power BI service.
> * Get some data and open it in report view.
> * Use that data to create visualizations and save it as a report.
> * Create a dashboard by pinning tiles from the report.
> * Add other visualizations to your dashboard by using the Q&A natural-language tool.
> * Resize, rearrange, and edit details for the tiles on the dashboard.
> * Clean up resources by deleting the dataset, report, and dashboard.

## Sign up for the Power BI service

You need a Power BI Pro or Premium Per User (PPU) license to create content in Power BI. If you don't have a Power BI account, and plan on creating content, [sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin. Complete the wizard to get a free license, open the Power BI service (app.powerbi.com), select the **Me** icon and choose either **Buy Pro now** or **Try paid features for free**.

 :::image type="content" source="media/service-get-started/power-bi-pro.png" alt-text="Screenshot of choosing Buy or Try.":::

## Step 1: Get data

Often, when you want to create a Power BI report, you start in Power BI Desktop. Power BI Desktop offers more power. You can transform, shape, and model data, before you start designing reports. This time though, we're going to start from scratch creating a report in the Power BI service.

In this tutorial, we get data from a simple Microsoft Excel file. Want to follow along? [Download the Financial Sample file](https://go.microsoft.com/fwlink/?LinkID=521962).

1. To begin, open the Power BI service (app.powerbi.com) in your browser. 

    Don’t have an account? No worries, you can [sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web)

1. Select **My workspace** in the navigation pane.

1. In **My workspace**, select **New** > **Upload a file**.

    The **Get Data** page opens.   

3. Under the **Create new content** section, select **Files** > **Local File**, then select the location where you saved the Excel file.
   
    :::image type="content" source="media/service-get-started/power-bi-service-get-data-local-file.png" alt-text="Screenshot of Create new content > Files.":::

5. Browse to the file on your computer, and choose **Open**.

6. For this tutorial, we select **Import** to add the Excel file as a dataset, which we can then use to create reports and dashboards. If you select **Upload**, the entire Excel workbook is uploaded to Power BI, where you can open and edit it in Excel Online.
   
   :::image type="content" source="media/service-get-started/power-bi-import.png" alt-text="Screenshot of choosing Import.":::
7. When your dataset is ready, select **More options (...)** next to your Financial Sample dataset, then select **Create report** to open the report editor.

    :::image type="content" source="media/service-get-started/power-bi-service-datasets.png" alt-text="Screenshot of All content > Create report.":::

    The report canvas is blank. We see the **Filters**, **Visualizations**, and **Fields** panes on the right.

    :::image type="content" source="media/service-get-started/power-bi-service-blank-reports.png" alt-text="Screenshot of blank report canvas.":::

    > [!TIP]
    > Select the global navigation button in the upper-left corner to collapse the navigation pane. That way your canvas has more room.
    >
    >:::image type="content" source="media/service-get-started/power-bi-global-nav-button.png" alt-text="Global navigation button.":::
    >

7. You're currently in Editing view. Notice the **Reading view** option in the menu bar. 

    :::image type="content" source="media/service-get-started/power-bi-service-reading-view.png" alt-text="Screenshot of Reading view option.":::

    While in Editing view, you can modify reports, because you're the *owner* and *creator* of the report. When you share your report with colleagues, often they can only interact with the report in Reading view. They are *consumers* of reports in your **My workspace**.

## Step 2: Create a chart in a report

Now that you've connected to data, start exploring. When you've found something interesting, you can save it on the report canvas. Then you can pin it to a dashboard to monitor it and see how it changes over time. But first things first

1. In the report editor, start in the **Fields** pane on the right side of the page to build a visualization. Select the  **Gross Sales** field, then the **Date** field.

   :::image type="content" source="media/service-get-started/power-bi-service-fields-pane-selected.png" alt-text="Screenshot of Fields list.":::

    Power BI analyzes the data and creates a column chart visualization. 

    > [!NOTE]
    > If you selected the **Date** field first instead of **Gross Sales**, you see a table. No worries! We're going to change the visualization in the next step.

    Some fields have sigma symbols next to them because Power BI detected that they contain numeric values.

    :::image type="content" source="media/service-get-started/power-bi-sigma-fields.png" alt-text="Fields with sigma symbols.":::

2. Let's switch to a different way of displaying this data. Line charts are good visuals for displaying values over time. Select the **Line chart** icon from the **Visualizations** pane.

   :::image type="content" source="media/service-get-started/power-bi-service-select-line-chart.png" alt-text="Screenshot of Report editor with line chart selected.":::

3. This chart looks interesting, so let's *pin* it to a dashboard. Hover over the visualization and select the pin icon that appears either above or below it.

   :::image type="content" source="media/service-get-started/power-bi-service-pin-visual.png" alt-text="Screenshot of Pin icon.":::

4. Because this report is new, you're prompted to save it before you can pin a visualization to a dashboard. Give your report a name (for example, *Financial Sample report*), then **Save**.

    Now you're looking at the report in Reading view.

5. Select the **Pin** icon again.

6. Select **New dashboard** and name it *Financial Sample dashboard*, for example. 

   :::image type="content" source="media/service-get-started/power-bi-pin.png" alt-text="Screenshot of Name the dashboard.":::
  
    A success message (near the top-right corner) lets you know the visualization was added as a tile to your dashboard.

    :::image type="content" source="media/service-get-started/power-bi-pin-success.png" alt-text="Screenshot of Pinned to dashboard dialog.":::

    Now that you've pinned this visualization, it's stored on your dashboard. The data stays up-to-date so you can track the latest value at a glance. However, if you change the visualization type in the report, the visualization on the dashboard doesn't change.

7. Select **Go to dashboard** to see your new dashboard with the line chart that you pinned to it as a tile.

   :::image type="content" source="media/service-get-started/power-bi-service-dashboard-tile.png" alt-text="Screenshot of dashboard with visualization pinned.":::

8. Select the new tile on your dashboard. Power BI returns you to the report in Reading view.

9. To switch back to Editing view, select **More options** (...) in the menu bar > **Edit**.

    :::image type="content" source="media/service-get-started/power-bi-service-edit-report.png" alt-text="Screenshot of select Edit to edit the report.":::

    Back in Editing view, you can continue to explore and pin tiles.

## Step 3: Explore with Q&A

For a quick exploration of your data, try asking a question in the Q&A question box. Q&A lets you ask natural-language queries about your data. In a dashboard, the Q&A box is at the top (**Ask a question about your data**) under the menu bar. In a report, it's in the top menu bar (**Ask a question**).

1. To go back to the dashboard, select **My workspace** in the black **Power BI** header bar.

    :::image type="content" source="media/service-get-started/power-bi-service-go-my-workspace.png" alt-text="Screenshot of Go back to My workspace.":::

2. In **My workspace**, select your dashboard.

    :::image type="content" source="media/service-get-started/power-bi-service-dashboard-tab.png" alt-text="Screenshot of select your dashboard.":::

3. Select **Ask a question about your data**. Q&A automatically offers a number of suggestions. 

    :::image type="content" source="media/service-get-started/power-bi-service-new-qanda.png" alt-text="Screenshot of Q&A canvas.":::

4. Some suggestions return a single value. For example, select **what is the average cog**.

    Q&A searches for an answer and presents it in the form of a *card* visualization.

5. Select **Pin visual** and pin this visualization to the Financial Sample dashboard.

    :::image type="content" source="media/service-get-started/power-bi-qna-pin-tile.png" alt-text="Screenshot of pinning the visual.":::

6. Go back to Q&A and select **Show all suggestions**.

7. Select **total profit by country**. 

    :::image type="content" source="media/service-get-started/power-bi-qna-total-profit-country.png" alt-text="Screenshot of total profit by country.":::

8. Pin the map to the Financial Sample dashboard, too.

9. On the dashboard, select the map you just pinned. See how it opens Q&A again?

10. Place the cursor after *by country* in the Q&A box and type *as bar*. Power BI creates a bar chart with the results.

    :::image type="content" source="media/service-get-started/power-bi-qna-profit-country-bar.png" alt-text="Screenshot of bar chart visualization.":::

11. Pin the bar chart to your Financial Sample dashboard, too.

12. Select **Exit Q&A** to return to your dashboard, where you see the new tiles you created. 

    :::image type="content" source="media/service-get-started/power-bi-service-dashboard-qna.png" alt-text="Screenshot of dashboard with Q&A visuals pinned.":::

    You see that even though you changed the map to a bar chart in Q&A, that tile remained a map because it was a map when you pinned it. 

## Step 4: Reposition tiles

We can rearrange the tiles to make better use of the dashboard space.

1. Drag the lower-right corner of the *Gross Sales* line chart tile upward, until it snaps at the same height as the Sales tile, then release it.

    :::image type="content" source="media/service-get-started/power-bi-service-resize-tile.png" alt-text="Screenshot of resizing the tile.":::

    Now the two tiles are the same height.

2. Select **More options (...)** for the Average of COGS tile > **Edit details**. 

    :::image type="content" source="media/service-get-started/power-bi-tile-edit-details.png" alt-text="Screenshot of More options menu for a tile.":::

3. In the **Title** box, type *Average Cost of Goods Sold* > **Apply**.

    :::image type="content" source="media/service-get-started/power-bi-tile-details-dialog.png" alt-text="Screenshot of Edit details dialog box.":::

4. Rearrange the other visuals to fit together.

    That looks better.

    :::image type="content" source="media/service-get-started/power-bi-service-rearranged-dashboard.png" alt-text="Screenshot of rearranged dashboard.":::

## Clean up resources

Now that you've finished the tutorial, you can delete the dataset, report, and dashboard. 

1. Select **My workspace** in the black **Power BI** header bar.
2. Select **More options (...)** next to the Financial Sample dataset > **Delete**.

    :::image type="content" source="media/service-get-started/power-bi-service-delete-dataset.png" alt-text="Screenshot of deleting the dataset.":::

    You see a warning that **All reports and dashboard tiles containing data from this dataset will also be deleted**.

3. Select **Delete**.

## Next steps

[Quickly create a report by pasting data into the Power BI service](../create-reports/service-quick-create-report.md)

Explore these collections of Microsoft Learn content for Power BI:

> [!div class="nextstepaction"]
>[Learn Power BI](/learn/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link)

> [!div class="nextstepaction"]
> [Become a Power BI data analyst](/users/microsoftpowerplatform-5978/collections/djwu3eywpk4nm)