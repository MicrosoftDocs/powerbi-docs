---
title: "Tutorial: Get started creating in the Power BI service"
description: Learn how to get started with the Power BI online service (app.powerbi.com) by following the steps in this tutorial.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 07/03/2023
#customer intent: As a Power BI customer or potential customer, I want to try it out for free and see how quick and intuitive it is so that I'll want to use it again and often, talk about it to colleagues and influence purchase and trial by others.  
LocalizationGroup: Get started
---

# Tutorial: Get started creating in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

This tutorial is an introduction to some of the features of the *Power BI service*. In this tutorial, you connect to data, create a report and a dashboard, and ask questions of your data. You can do many more tasks in the Power BI service. This tutorial is just to get you started. For an understanding of how the Power BI service fits in with the other Power BI offerings, we recommend reading [What is Power BI](power-bi-overview.md).

Are you a report *reader* rather than a creator? [Getting around in the Power BI service](../consumer/end-user-experience.md) is a good starting place for you.

:::image type="content" source="media/service-get-started/power-bi-service-rearranged-dashboard.png" alt-text="Screenshot that shows the dashboard for the Financial Sample dataset.":::

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

You need a Power BI Pro or Premium Per User (PPU) license to create content in Power BI. If you don't have a Power BI account, and plan on creating content, [sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin. Complete the wizard to get a free license. Open the Power BI service (app.powerbi.com), select the **Me** icon, and choose **Buy Pro now** or **Try paid features for free**.

:::image type="content" source="media/service-get-started/power-bi-pro.png" alt-text="Screenshot that shows how to choose the type of license to purchase.":::

## Step 1: Get data

Often, when you want to create a Power BI report, you start in Power BI Desktop. Power BI Desktop offers more power. You can transform, shape, and model data, before you start designing reports.

For this tutorial, we start from scratch by creating a report in the Power BI service rather than through the Desktop. We create a dataset from a simple Microsoft Excel file that contains sample financial data.

1. Open the Power BI service (app.powerbi.com) in your browser. 

   Don't have an account? [Sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. [Download the Excel file](https://go.microsoft.com/fwlink/?LinkID=521962) that has the Financial Sample data.

1. Select **My workspace** in the left navigation.

1. Select **New** > **Dataset** to initiate the import process. The **Add data to start building a report** page opens.

   :::image type="content" source="media/service-get-started/new-dataset.png" alt-text="Screenshot that shows how to create a new dataset to initiate the import process." lightbox="media/service-get-started/new-dataset.png" border="false":::

   > [!NOTE]
   > If you select **Upload** instead of **New**, the Power BI service uploads the entire Excel workbook. You can then open and edit the workbook in Excel Online.

1. On the **Add data to start building a report** page, select **Excel**.

   :::image type="content" source="media/service-get-started/build-excel-report.png" alt-text="Screenshot that shows how to build a report from an Excel dataset." lightbox="media/service-get-started/build-excel-report.png" border="false":::

1. On the **Select a file** dialog, browse to the location where you saved the Excel file on your computer.

1. Select the file and choose **Import**.

   The Power BI service imports the sample data from the Excel file as a dataset and opens the Financial Sample page.
   
   :::image type="content" source="media/service-get-started/financial-sample-dataset.png" alt-text="Screenshot that shows the imported Financial Sample dataset page." lightbox="media/service-get-started/financial-sample-dataset.png" border="false":::
   
   You can then use the sample dataset to create reports and dashboards. 

1. On the Financial Sample dataset page, at the top, select **Create a report** > **Start from scratch** to open the report editor.

   :::image type="content" source="media/service-get-started/create-report-from-scratch.png" alt-text="Screenshot that shows how to create a report from scratch.":::

The Power BI service opens the new report in **My workspace**. The report canvas is blank and shows the **Filters**, **Visualizations**, and **Fields** panes.

:::image type="content" source="media/service-get-started/blank-report-canvas.png" alt-text="Screenshot that shows a blank report canvas in My workspace." lightbox="media/service-get-started/blank-report-canvas.png" border="false":::

### Switch between views

The new report opens in **Editing** view. To view your report in progress, you can switch to the **Reading** view at the top of the page: 

:::image type="content" source="media/service-get-started/report-reading-view.png" alt-text="Screenshot that shows how to switch to the Reading view of a report canvas.":::

In the Editing view, you can modify reports because you're the *owner* and *creator* of the report. When you share your report with colleagues, often they can only interact with the report in Reading view. Other users are *consumers* of reports in your **My workspace**.

## Step 2: Create a chart in a report

Now that you've connected to data, start exploring. When you've found something interesting, you can save it on the report canvas. Then you can pin it to a dashboard to monitor it and see how it changes over time. But first things first

1. In the report editor, start in the **Fields** pane on the right side of the page to build a visualization. Select the  **Gross Sales** field, then the **Date** field.

   :::image type="content" source="media/service-get-started/power-bi-service-fields-pane-selected.png" alt-text="Screenshot of Fields list.":::

   Power BI analyzes the data and creates a column chart visualization. 

   > [!NOTE]
   > If you selected the **Date** field first instead of **Gross Sales**, you see a table. No worries! We're going to change the visualization in the next step.

   Some fields have sigma symbols next to them because Power BI detected that they contain numeric values.

   :::image type="content" source="media/service-get-started/power-bi-sigma-fields.png" alt-text="Fields with sigma symbols.":::

1. Let's switch to a different way of displaying this data. Line charts are good visuals for displaying values over time. Select the **Line chart** icon from the **Visualizations** pane.

   :::image type="content" source="media/service-get-started/power-bi-service-select-line-chart.png" alt-text="Screenshot of Report editor with line chart selected.":::

1. This chart looks interesting, so let's *pin* it to a dashboard. Move the mouse over the visualization and select the pin icon that appears.

   :::image type="content" source="media/service-get-started/power-bi-service-pin-visual.png" alt-text="Screenshot of Pin icon.":::

1. Because this report is new, you're prompted to save it before you can pin a visualization to a dashboard. Give your report a name (for example, *Financial Sample report*), then **Save**.

   Now you're looking at the report in Reading view.

1. Select the **Pin** icon again.

1. Select **New dashboard** and name it *Financial Sample dashboard*, for example. 

   :::image type="content" source="media/service-get-started/power-bi-pin.png" alt-text="Screenshot of Name the dashboard.":::
  
   A success message (near the top-right corner) lets you know the visualization was added as a tile to your dashboard.

1. Select **Go to dashboard** to see your new dashboard with the line chart that you pinned to it as a tile.

   :::image type="content" source="media/service-get-started/power-bi-pin-success.png" alt-text="Screenshot of Pinned to dashboard dialog.":::

   Now that you've pinned this visualization, it's stored on your dashboard. The data stays up-to-date so you can track the latest value at a glance. However, if you change the visualization type in the report, the visualization on the dashboard doesn't change.

   :::image type="content" source="media/service-get-started/power-bi-service-dashboard-tile.png" alt-text="Screenshot of dashboard with visualization pinned.":::

1. Select the new tile on your dashboard. Power BI returns you to the report in Reading view.

1. To switch back to Editing view, select **More options** (...) in the menu bar > **Edit**.

   :::image type="content" source="media/service-get-started/power-bi-service-edit-report.png" alt-text="Screenshot of select Edit to edit the report.":::

   Back in Editing view, you can continue to explore and pin tiles.

## Step 3: Explore with Q&A

For a quick exploration of your data, try asking a question in the Q&A question box. Q&A lets you ask natural-language queries about your data. In a dashboard, the Q&A box is at the top (**Ask a question about your data**) under the menu bar. In a report, it's in the top menu bar (**Ask a question**).

1. To go back to the dashboard, select **My workspace** in the black **Power BI** header bar.

   :::image type="content" source="media/service-get-started/power-bi-service-go-my-workspace.png" alt-text="Screenshot of Go back to My workspace.":::

1. In **My workspace**, select your dashboard.

   :::image type="content" source="media/service-get-started/power-bi-service-dashboard-tab.png" alt-text="Screenshot of select your dashboard.":::

1. Select **Ask a question about your data**. Q&A automatically offers several suggestions. 

   :::image type="content" source="media/service-get-started/power-bi-service-new-qanda.png" alt-text="Screenshot of Q&A canvas.":::

1. Some suggestions return a single value. For example, select **what is the average sale**.

   Q&A searches for an answer and presents it in the form of a *card* visualization.

1. Select **Pin visual** and pin this visualization to the Financial Sample dashboard.

   :::image type="content" source="media/service-get-started/power-bi-qna-pin-tile.png" alt-text="Screenshot of pinning the visual.":::

1. Go back to Q&A and type *total profit by country*. 

   :::image type="content" source="media/service-get-started/power-bi-qna-total-profit-country-region.png" alt-text="Screenshot of total profit by country/region.":::

1. Pin the map to the Financial Sample dashboard, too.

1. On the dashboard, select the pinned map. See how it opens Q&A again?

1. Place the cursor after *by country* in the Q&A box and type *as bar*. Power BI creates a bar chart with the results.

   :::image type="content" source="media/service-get-started/power-bi-qna-profit-country-region-bar.png" alt-text="Screenshot of bar chart visualization.":::

1. Pin the bar chart to your Financial Sample dashboard, too.

1. Select **Exit Q&A** to return to your dashboard, where you see the new tiles you created. 

   Even though you changed the map to a bar chart in Q&A, the tile remained a map because the tile was a map when you pinned it. 

   :::image type="content" source="media/service-get-started/power-bi-service-dashboard-qna.png" alt-text="Screenshot of dashboard with Q&A visuals pinned.":::

## Step 4: Reposition tiles

We can rearrange the tiles to make better use of the dashboard space.

1. Drag the lower-right corner of the *Gross Sales* line chart tile upward, until it snaps at the same height as the *Average of Sales* tile, then release it.

   :::image type="content" source="media/service-get-started/power-bi-service-resize-tile.png" alt-text="Screenshot of resizing the tile.":::

   Now the two tiles are the same height.

1. Select **More options (...)** for the Average of Sales tile > **Edit details**. 

   :::image type="content" source="media/service-get-started/power-bi-tile-edit-details.png" alt-text="Screenshot of More options menu for a tile.":::

1. In the **Title** box, type *Sales Average* > **Apply**.

   :::image type="content" source="media/service-get-started/power-bi-tile-details-dialog.png" alt-text="Screenshot of Edit details dialog box.":::

1. Rearrange the other visuals to fit together.

   That looks better.

   :::image type="content" source="media/service-get-started/power-bi-service-rearranged-dashboard.png" alt-text="Screenshot of rearranged dashboard.":::

## Clean up resources

Now that you've finished the tutorial, you can delete the dataset, report, and dashboard. 

1. Select **My workspace** in the black **Power BI** header bar.
1. Select **More options (...)** next to the Financial Sample dataset > **Delete**.

   :::image type="content" source="media/service-get-started/power-bi-service-delete-dataset.png" alt-text="Screenshot of deleting the dataset.":::

   You see a warning that **All reports and dashboard tiles containing data from this dataset will also be deleted**.

1. Select **Delete**.

## Next steps

[Quickly create a report by pasting data into the Power BI service](../create-reports/service-quick-create-report.md)

Explore these training resources for Power BI:

> [!div class="nextstepaction"]
>[Learn Power BI](/training/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link)

> [!div class="nextstepaction"]
> [Become a Power BI data analyst](/users/microsoftpowerplatform-5978/collections/djwu3eywpk4nm)
