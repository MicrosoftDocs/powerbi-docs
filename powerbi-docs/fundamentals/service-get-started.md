---
title: "Tutorial: Get started creating in the Power BI service"
description: Learn how to get started with the Power BI online service (app.powerbi.com) by following the steps in this tutorial.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 11/14/2024
#customer intent: As a Power BI customer or potential customer, I want to try it out for free and see how quick and intuitive it is so that I'll want to use it again and often, talk about it to colleagues and influence purchase and trial by others.  
LocalizationGroup: Get started
---

# Tutorial: Get started creating in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

This tutorial is an introduction to some of the features of the *Power BI service*. In this tutorial, you connect to data, create a report and a dashboard, and ask questions about your data. The exercises show you how to work with data on a dashboard and design semantic model visualizations. Here's an example dashboard:

:::image type="content" source="media/service-get-started/dashboard.png" alt-text="Screenshot of an example Power BI dashboard with sample semantic model visualizations." border="false":::

In the Power BI service, you can accomplish many different tasks, and this tutorial can help you get started. For an understanding of how the Power BI service fits in with the other Power BI offerings, we recommend reading [What is Power BI](power-bi-overview.md)?

If you're a report *reader* rather than a creator, check out the [Getting around in the Power BI service](../consumer/end-user-experience.md) tutorial.

In this tutorial, you complete the following tasks:

> [!div class="checklist"]
> * Sign in to your Power BI online account, or sign up, if you don't have an account yet.
> * Open the Power BI service.
> * Add and view data in reading or editing mode.
> * Use data to create visualizations and save designs as a report.
> * Create a dashboard by pinning tiles from the report.
> * Add other visualizations to a dashboard with the Q&A natural-language tool.
> * Resize, rearrange, and edit details for the tiles on the dashboard.
> * Clean up resources by deleting the semantic model, report, and dashboard.

## Sign up for the Power BI service

You need a Power BI Pro or Premium Per User (PPU) license to create content in Power BI. If you don't have a Power BI account, and plan on creating content, [sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin. Complete the wizard to get a free license. Open the Power BI service (app.powerbi.com), and select the **Me** icon. Choose **Premium Per User - Start trial** or **Buy Fabric now**.

Although a paid or trial license is recommended, it is not required for this tutorial. Even if you can't try the steps yourself, the description and screenshots still provide you with an introduction to working with data in the Power BI service.  

:::image type="content" source="media/service-get-started/power-bi-pro.png" alt-text="Screenshot that shows how to choose the type of license to purchase." border="false":::

## Step 1: Add data to create a report

Often, when you want to create a Power BI report, you start in Power BI Desktop. Power BI Desktop offers more power. You can transform, shape, and model data, before you start designing reports.

For this tutorial, we start from scratch by creating a report in the Power BI service rather than through the Desktop. We create a semantic model from a simple Microsoft Excel file that contains sample financial data.

1. Open the Power BI service (app.powerbi.com) in your browser. 

   Don't have an account? [Sign up for a free Power BI Premium Per User 60 day trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. [Download the Excel file](https://go.microsoft.com/fwlink/?LinkID=521962) that has the Financial Sample data.

1. Select **My workspace** in the navigation pane.

1. Select **New item** > **Semantic model** to initiate the import process. The **Add data to start building a report** page opens.

   :::image type="content" source="media/service-get-started/power-bi-new-mode.png" alt-text="Screenshot that shows how to create a new semantic model to initiate the import process." border="false":::

1. On the **Add data to start building a report** page, select **Excel**.

   :::image type="content" source="media/service-get-started/build-excel-report.png" alt-text="Screenshot that shows how to build a report from an Excel semantic model." border="false":::

   > [!NOTE]
   > If you select **Upload** instead of **New**, the Power BI service uploads the entire Excel workbook. You can then open and edit the workbook in Excel Online.

1. In the **Select a file** dialog, browse to the location where you saved the Excel file on your computer.

1. Select the file and choose **Select** > **Link to file** > **Next**.

   > [!NOTE]
   > If the file doesn't open, try removing the Sensitivity label.

1. Select the data to use by placing a checkmark next to **financials** and choosing **Create**.

   The Power BI service imports the sample data from the Excel file as a semantic model and opens the Financial Sample page.
   
   :::image type="content" source="media/service-get-started/financial-sample-dataset.png" alt-text="Screenshot that shows the imported Financial Sample semantic model page." border="false":::
   
   You can now use the sample semantic model to create reports and dashboards. 

1. On the Financial Sample semantic model page, at the top, select **Create a report** > **Start from scratch** to open the report editor.

   :::image type="content" source="media/service-get-started/create-report-from-scratch.png" alt-text="Screenshot that shows how to create a report from scratch.":::

The Power BI service opens the new report in **My workspace**. The report canvas is blank and shows the **Filters**, **Visualizations**, and **Data** panes.

:::image type="content" source="media/service-get-started/blank-report-canvas.png" alt-text="Screenshot that shows a blank report canvas in My workspace with the Filters, Visualizations, and Data panes open." border="false":::

### Switch between report views

The new report opens in **Editing** view. To view your report in progress, you can switch to the **Reading** view at the top of the page: 

:::image type="content" source="media/service-get-started/report-reading-view.png" alt-text="Screenshot that shows how to switch to the Reading view of a report canvas.":::

In the Editing view, you can modify reports because you're the *owner* and *creator* of the report. When you share your report with colleagues, they often can interact with the report in Reading view only. Other users are *consumers* of reports in your **My workspace**.

When you're ready to continue to working on your report, select **Edit**:

:::image type="content" source="media/service-get-started/report-editing-view.png" alt-text="Screenshot that shows how to switch to the Editing view of a report canvas.":::

## Step 2: Create a chart in a report

After you connect data to build a report, you're ready to start exploring. When you find an interesting item, you can save it on the report canvas. You can pin the item to a dashboard to monitor the data for changes over time.

We can start by adding a column chart to the report in the editor to build a visualization of the data.

1. In the **Data** pane, select the arrow next to the **financials** heading to show the data items.

   Some data items have a sigma symbol (&Sigma;) next to the name. Power BI displays the sigma next to data that has numeric values.

   :::image type="content" source="media/service-get-started/data-pane-sigma-symbol.png" alt-text="Screenshot that shows items in the Data pane with a sigma symbol to indicate the data has numeric values.":::

1. Under **financials**, select the **Gross Sales** data item, and then select the **Date** item. 

   :::image type="content" source="media/service-get-started/data-pane-selected-items.png" alt-text="Screenshot that shows the Gross Sales and Date data items selected in the Data pane.":::

   Power BI analyzes the selected data and creates a column chart visualization. 

   :::image type="content" source="media/service-get-started/visualizations-column-chart.png" alt-text="Screenshot that shows a column chart visualization for the selected data items.":::

   > [!NOTE]
   > If you select the **Date** item before you select the **Gross Sales** item, Power BI creates a table rather than a column chart. If you selected the data items in this order, it's not a problem. We're going to change the visualization of the data in the next step.

1. Let's try a different display of the selected data. Line charts are good visuals for showing changes in values over time. In the **Visualizations** pane, select **Line chart**.

   :::image type="content" source="media/service-get-started/visualizations-select-line-chart.png" alt-text="Screenshot that shows how to select the line chart display in the Visualizations pane.":::

1. The line chart looks interesting, so let's *pin* the visualization to a dashboard. Select the **Pin** icon on the visualization.

   :::image type="content" source="media/service-get-started/visualizations-pin-line-chart.png" alt-text="Screenshot that shows how to pin a visualization to a dashboard.":::

   When the report is new, you're prompted to save the report before you can pin the visualization to a dashboard.
   
   - Enter a name for the report, such as **Financial Sample report**, and select **Save**.

   Power BI saves the report to the selected location. The default is **My workspace**. Power BI shows the report in Reading view.

1. Position the mouse over the visualization and select the **Pin** icon again. The **Pin to dashboard** pop-up dialog opens.

1. In the pop-up dialog, select **New dashboard**, and enter a name for the dashboard, such as **Financial Sample dashboard**. Select **Pin**.

   :::image type="content" source="media/service-get-started/save-dashboard.png" alt-text="Screenshot that shows how to save a new dashboard so you can pin an item." border="false":::
  
   Power BI displays a success message after the service adds the visualization to the dashboard. The success dialog includes an option to create an optimized layout of the dashboard for your mobile device.

1. In the message dialog, select **Go to dashboard**. 

   :::image type="content" source="media/service-get-started/open-new-dashboard.png" alt-text="Screenshot of the Pinned to dashboard dialog with the option to go to the new dashboard." border="false":::

   After you pin a visualization, it's pinned on the dashboard as a *tile*. The data in the visualization stays up-to-date so you can track the latest value at a glance.

   :::image type="content" source="media/service-get-started/dashboard-pin-tile-line-chart.png" alt-text="Screenshot that shows the dashboard with a pinned visualization tile." border="false":::

   > [!NOTE]
   > After you pin a visualization, if you change the visualization type in the report, the pinned visualization on the dashboard **doesn't** change. To see the new visualization, pin it to the dashboard to create another tile. The use of multiple tiles lets you have more than one visualization of the same data on your dashboard.

1. Now select the tile on the dashboard:

   :::image type="content" source="media/service-get-started/dashboard-select-tile.png" alt-text="Screenshot that shows a selected tile on the dashboard.":::

   The Power BI service returns you to the report editor where you can refine the visualization:

   :::image type="content" source="media/service-get-started/report-editor-line-chart.png" alt-text="Screenshot that shows a visualization open in the report editor and the Edit option selected." border="false":::

   You can select **Edit** to return to Editing view and continue to explore and pin tiles.

## Step 3: Explore visualizations with Q&A

For a quick exploration of your data, try asking a question in the Q&A question box. Q&A lets you ask natural-language queries about your data.

In the Power BI service, you can find the Q&A question box in two places.

- On a dashboard, the **Ask a question about your data** Q&A box is at the top of the tile view:

   :::image type="content" source="media/service-get-started/dashboard-qna-box.png" alt-text="Screenshot that shows the Q&A question box in the dashboard tile view.":::

- In the report editor, the **Ask a question** Q&A box is in the top menu bar:

   :::image type="content" source="media/service-get-started/report-editor-qna-box.png" alt-text="Screenshot that shows the Q&A question box in the report editor menu bar.":::

When you select the Q&A box, Power BI opens an extended view to help you ask questions and find answers.

Let's try out the Q&A experience for a dashboard.

1. In the Power BI service, select **My workspace**, and then select your dashboard for the Financial Sample.

   :::image type="content" source="media/service-get-started/open-my-workspace-dashboard.png" alt-text="Screenshot that shows how to return to My workspace and open the Financial Sample dashboard." border="false":::

1. At the top of the tile view, select **Ask a question about your data**. The view expands and Q&A offers several suggestions. 

   :::image type="content" source="media/service-get-started/dashboard-qna-expand-view.png" alt-text="Screenshot that shows the expanded view of Q&A with suggestions.":::

   You can select a suggestion and see the results, or enter your own question in the Q&A box.

1. In the Q&A box, enter the question **what is the average sale**. As you type, Q&A tries to pattern match your text entry for recognized questions.

   :::image type="content" source="media/service-get-started/dashboard-qna-ask-question.png" alt-text="Screenshot that shows how Q&A tries to pattern match your text for recognized questions." border="false":::

   Q&A searches for an answer and displays the answer as a *card* visualization.

1. At the top right, select **Pin visual** and pin the visualization to the Financial Sample dashboard.

   :::image type="content" source="media/service-get-started/dashboard-qna-pin-average-sale.png" alt-text="Screenshot that shows how to pin the Q&A answer visualization to a dashboard." border="false":::

1. Try another question in the Q&A box. Enter **total profit by country**. 

   :::image type="content" source="media/service-get-started/dashboard-qna-country-profit.png" alt-text="Screenshot of the Q&A map visualization of the Financial Sample data for total profit by country and region." border="false":::

1. Pin the country/region map visualization to the Financial Sample dashboard.

1. In the success dialog, select **Go to dashboard** to view the newly pinned tiles on your dashboard.

1. On the dashboard, select the pinned country/region map. Notice how the visualization opens in Q&A.

1. Place the cursor after **by country** in the Q&A box and enter **as bar**. Power BI creates a bar chart with the results.

   :::image type="content" source="media/service-get-started/dashboard-qna-country-profit-bar.png" alt-text="Screenshot that shows the Q&A bar chart visualization for the Financial Sample country and region data." border="false":::

1. Pin the bar chart to your Financial Sample dashboard.

1. At the top, select **Exit Q&A** to return to your dashboard.

You now have four pinned tiles on your dashboard: line chart, numeric average, country/region map, and bar chart.

:::image type="content" source="media/service-get-started/dashboard-qna-tiles.png" alt-text="Screenshot of the Financial Sample dashboard with pinned Q&A visualization tiles." border="false":::

### Pin different views of data with multiple tiles

Notice that although you changed the map visualization to a bar chart in Q&A, the corresponding tile on the dashboard still shows a map.

When you pin a tile to a dashboard, the tile always displays the data by using the original visualization type. If you change the visualization type for an existing tile, and pin the tile, Power BI creates a new tile with the new visualization type. The original tile remains unchanged. The use of multiple tiles enables you to have more than one visualization of the same data on your dashboard.

## Step 4: Adjust tile layout on the dashboard

Tiles on the dashboard can be rearranged and adjusted to make better use of the space. You can change tile sizes, reposition tiles, and work with tile details to improve the layout.

### Adjust tile size

Let's change the size of the *Gross sales* line chart tile to be the same height as the *Average of Sales* tile.

1. Select the lower-right corner of the *Gross sales* line chart tile and drag the tile outline upward to reduce the overall tile height.

1. Continue to drag the tile outline upward until the tile snaps into place at the same height as the *Average of Sales* tile.

1. When the tile has the desired height, release the mouse.

:::image type="content" source="media/service-get-started/dashboard-resize-tile.png" alt-text="Screenshot that shows how to resize a tile on the dashboard.":::

The two tiles are now the same height.
 
### Modify tile details

Sometimes changing **Tile details** can improve the dashboard presentation. 

:::image type="content" source="media/service-get-started/dashboard-tile-edit-details.png" alt-text="Screenshot that shows how to open the details for a tile on the dashboard.":::

1. On the *Average of Sales* tile, select **More options (...)** > **Edit details**. 

1. In the **Tile details** dialog, in the **Title** box, enter **Sales Average**.

1. Select **Apply**.

:::image type="content" source="media/service-get-started/edit-tile-details.png" alt-text="Screenshot that shows how to edit the details for a tile on the dashboard.":::

### Rearrange tiles

You can move a tile by selecting the tile and dragging it to a new location.

1. Select the country/region map tile, and drag the tile to the right of the bar chart. 

1. When the tile's in the desired position, release the mouse.

Notice that these two tiles take up more width on the dashboard than the *Gross sales* line chart tile and the *Sales Average* tile. You can improve the layout by increasing the overall width of the line chart tile.

Here's an example of the dashboard with the improved layout:

:::image type="content" source="media/service-get-started/dashboard.png" alt-text="Screenshot that shows the tiles rearranged on the dashboard to make better use of the space." border="false":::

## Clean up resources

After you finish the tutorial, it's a good practice to delete the semantic model, report, and dashboard.

When you delete a semantic model, the Power BI service also deletes all reports and dashboard tiles that use data from the semantic model.

1. In the Power BI service, select **My workspace**.

1. Locate the Financial Sample **semantic model**.

1. Select **More options (...)** > **Delete**.

   :::image type="content" source="media/service-get-started/delete-dataset.png" alt-text="Screenshot that shows how to delete a semantic model in My workspace.":::

   Power BI displays a warning message: _All reports and dashboard tiles containing data from this semantic model will also be deleted_.

1. Select **Delete**.

## Related content

* [Create quick reports](../create-reports/service-quick-create-report.md) in the Power BI service.
* Learn all about [Microsoft Power BI](/training/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link).
* Become a [Microsoft Certified: Power BI Data Analyst Associate](/certifications/power-bi-data-analyst-associate/).
