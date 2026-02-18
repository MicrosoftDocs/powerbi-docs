---
title: "Tutorial: Get Started Creating in the Power BI Service"
description: Learn how to get started with the Power BI online service (app.powerbi.com) by following the steps in this tutorial.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 12/01/2025
ms.collection: ce-skilling-ai-copilot
ms.custom: copilot-scenario-highlight
#customer intent: As a Power BI customer or potential customer, I want to try it out for free and see how quick and intuitive it is so that I'll want to use it again and often, talk about it to colleagues and influence purchase and trial by others.  
LocalizationGroup: Get started
ai-usage: ai-assisted
---

# Tutorial: Get started creating in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

This tutorial is an introduction to some of the features of the *Power BI service*. In this tutorial, you connect to data, create a report and a dashboard, and ask questions about your data. The exercises show you how to work with data on a dashboard and design semantic model visualizations. Here's an example dashboard:

:::image type="content" source="media/service-get-started/dashboards.png" alt-text="Screenshot of an example Power BI dashboard with sample semantic model visualizations." :::

In the Power BI service, you can accomplish many different tasks, and this tutorial can help you get started. For an understanding of how the Power BI service fits in with the other Power BI offerings, we recommend reading [What is Power BI](power-bi-overview.md)?

In this tutorial, you complete the following tasks:

> [!div class="checklist"]
>
> * Sign in to your Power BI online account, or sign up, if you don't have an account yet.
> * Open the Power BI service.
> * Add and view data in reading or editing mode.
> * Use data to create visualizations and save designs as a report.
> * Create a dashboard by pinning tiles from the report.
> * Add visualizations to a report and dashboard using Copilot.
> * Add other visualizations to a dashboard with the Q&A natural-language tool.
> * Resize, rearrange, and edit details for the tiles on the dashboard.
> * Clean up resources by deleting the semantic model, report, and dashboard.

## Sign up for the Power BI service

You need a Power BI Pro or Premium Per User (PPU) license to create content in Power BI. If you don't have a Power BI account and plan on creating content, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin. Complete the wizard to get a license. Open the Power BI service (app.powerbi.com), and select the **Account manager** icon. Choose **Free trial**.

Although a paid or trial license is recommended, it isn't required for this tutorial. Even if you can't try the steps yourself, the description and screenshots still provide you with an introduction to working with data in the Power BI service.  

:::image type="content" source="media/service-get-started/power-bi-pro.png" alt-text="Screenshot that shows how to choose the type of license to purchase." border="false":::

## Add data to create a report

Often, when you want to create a Power BI report, you start in Power BI Desktop. Power BI Desktop offers more power. You can transform, shape, and model data, before you start designing reports.

For this tutorial, we start from scratch by creating a report in the Power BI service rather than through the Desktop. We create a semantic model from a simple Microsoft Excel file that contains sample financial data.

1. Open the Power BI service (app.powerbi.com) in your browser.

   Don't have an account? [Sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. [Download the Excel file](https://go.microsoft.com/fwlink/?LinkID=521962) that has the Financial Sample data.

1. Select **My workspace** in the navigation pane.

1. Select **New item** > **Semantic model** to initiate the import process. The **Add data to start building a report** page opens.

   :::image type="content" source="media/service-get-started/power-bi-new-mode.png" alt-text="Screenshot that shows how to create a new semantic model to initiate the import process." border="false":::

1. On the **Add data to start building a report** page, select **Excel**.

   :::image type="content" source="media/service-get-started/build-excel-reports.png" alt-text="Screenshot that shows how to build a report from an Excel semantic model." border="false":::

   > [!NOTE]
   > If you select **Upload** instead of **Link to file**, the Power BI service uploads the entire Excel workbook. You can then open and edit the workbook in Excel Online.

1. In the **Select a file** dialog, browse to the location where you saved the Excel file on your computer.

1. Select the file and choose **Select** > **Link to file** > **Next**.

   > [!NOTE]
   > If the file doesn't open, try changing the Sensitivity label to **Public**.

1. Select the data to use by placing a checkmark next to **financials** and choosing **Create**.

   The Power BI service imports the sample data from the Excel file as a semantic model and opens a report canvas. We can now use the sample semantic model to create reports and dashboards. We're going to create a report partly from scratch and partly using Copilot. Let's start with Copilot.

   :::image type="content" source="media/service-get-started/power-bi-financials-sample.png" alt-text="Screenshot that shows the imported Financial Sample semantic model page." border="false":::

After you connect data to build a report, you're ready to start exploring. When you find an interesting item, you can save it on the report canvas. From the report canvas, you can pin the item to a dashboard to monitor the data for changes over time.

We can start by asking Copilot to review our data and suggest some visuals.

> [!NOTE]
> **If Copilot isn't available:** Copilot requires your organization to enable it and may not be available in all regions or for all license types. If you don't see Copilot:
>
> - Check with your administrator to see if Copilot is enabled for your organization.
> - You can still complete this tutorial by creating visuals manually (skip to the [Create report visuals from scratch](#create-report-visuals-from-scratch) section).
> - For more information about Copilot availability, see [Copilot for Power BI overview](../create-reports/copilot-introduction.md).

### Switch between report views

Reports have two modes: **Editing** and **Reading**. To create a report, add visuals, and edit your report, use **Editing** mode. To view your report in progress, switch to the **Reading** view at the top of the page:

:::image type="content" source="media/service-get-started/report-reading-view.png" alt-text="Screenshot that shows how to switch to the Reading view of a report canvas.":::

In the Editing view, you can modify reports because you're an *owner* or  *creator* of the report. When you share your report with colleagues, they often can interact with the report in Reading view only.

When you're ready to continue working on your report, select **Edit**:

:::image type="content" source="media/service-get-started/report-editing-view.png" alt-text="Screenshot that shows how to switch to the Editing view of a report canvas.":::

## Build a report

There are many ways to build a report. In this article, we start by using Microsoft Copilot to create some report pages. Next, we add more visuals to a report page from scratch.

### Use Copilot to create a report in Power BI

You can get AI assistance from Copilot. Generate a Power BI report based on gross sales in Power BI.

```copilot-prompt
Create a Gross Sales report.
 ```

Copilot creates a report page and names it *Gross Sales Report*. Copilot is powered by AI, so it's important to verify the accuracy of results. For more information, see [Copilot for Microsoft Fabric and Power BI: FAQ](/fabric/fundamentals/copilot-faq-fabric).

### Pin a report visual to a dashboard

Create a new dashboard using one of the visuals from the report. Select the *Gross Sales Trend Over Time* visual. Hover over the visual and select **Pin visual** > **New dashboard** > **Keep current theme**. Give the new dashboard a name and select **Pin**. You can pin the whole report by selecting **Pin to a dashboard** in the top menu bar.

After you pin a visualization, it appears on the dashboard as a *tile*. The data in the visualization stays up-to-date so you can track the latest value at a glance.

:::image type="content" source="media/service-get-started/power-bi-pin-report-visual.png" alt-text="Screenshot of the pinning options within a report." border="false":::

> [!NOTE]
> When the report is new, you're prompted to save the report before you can pin the visualization to a dashboard. Power BI saves the report to the selected location. The default is **My workspace**. Power BI shows the report in Reading view.

To continue editing the report, select **Edit** from the top menu bar.

### Use Copilot to suggest insights

1. Add a new report page by selecting the plus icon (+) at the bottom of the report.

1. Ask Copilot to suggest content.

   ```copilot-prompt
   Suggest content for a new report page.
    ```
   
   Select **Profit Analysis by Product** > **Create**. Copilot creates a new report page for you and names it *Profit Analysis by Product*.

1. Select another visual to pin to your dashboard. Select **Profit by Product** and pin it to the same dashboard.

### Create report visuals from scratch

Add a new page to your report. The new report page canvas is blank and shows the **Filters**, **Visualizations**, and **Data** panes.

:::image type="content" source="media/service-get-started/power-bi-blank-page.png" alt-text="Screenshot that shows a blank report canvas in My workspace with the Visualizations and Data panes open." :::

1. In the **Data** pane, select the arrow next to the **financials** heading to show the data items.

   Some data items have a sigma symbol (&Sigma;) next to the name. Power BI displays the sigma next to data that has numeric values.

   > [!NOTE]
   > **Don't see sigma or calendar symbols?** These icons appear based on Power BI's automatic detection of data types. If your semantic model was imported differently or uses calculated columns, you might not see these symbols. The symbols are visual indicators only; your data still works correctly in visualizations regardless of whether the icons appear.

   :::image type="content" source="media/service-get-started/data-pane-sigma-symbol.png" alt-text="Screenshot that shows items in the Data pane with a sigma symbol to indicate the data has numeric values.":::

1. Under **financials**, select the **Profit** data item, and then select the **Date** item. **Date** has a hierarchy, so expand **Date** and select **Quarter** and **Year**.

   :::image type="content" source="media/service-get-started/power-bi-hierarchy-line.png" alt-text="Screenshot that shows the Gross Sales and Date data items selected in the Data pane.":::

   > [!NOTE]
   > If you select the **Date** items before you select the **Profit** item, Power BI creates a table rather than a column chart. If you selected the items in this order, it's not a problem. We're going to change the visualization of the data in step 4.

1. Expand the **Filters** pane and change **Date - Year** to **2014**.

   Power BI analyzes the selected data and creates a column chart visualization.

   :::image type="content" source="media/service-get-started/power-bi-chart-column.png" alt-text="Screenshot that shows a column chart visualization for the selected data items.":::

1. Let's try a different display of the selected data. Line charts are good visuals for showing changes in values over time. With the visual active, in the **Visualizations** pane, select **Line chart**.

   :::image type="content" source="media/service-get-started/power-bi-line.png" alt-text="Screenshot that shows how to select the line chart display in the Visualizations pane.":::

1. The line chart looks interesting, so let's pin the visualization to our dashboard.

1. In the message dialog, select **Go to dashboard**.

   Power BI displays a success message after the service adds the visualization to the dashboard. The success dialog includes an option to create an optimized layout of the dashboard for mobile devices.

   :::image type="content" source="media/service-get-started/open-new-dashboard.png" alt-text="Screenshot of the Pinned to dashboard dialog with the option to go to the new dashboard." border="false":::

   Your dashboard shows the tiles you pinned earlier when you were using Copilot plus the line chart that you created. 

   :::image type="content" source="media/service-get-started/power-bi-dashboard-tiles.png" alt-text="Screenshot that shows the dashboard with a pinned visualization tile." :::

   > [!NOTE]
   > After you pin a visualization, if you change the visualization type in the report, the pinned visualization on the dashboard **doesn't** change. To see the new visualization, pin it to the dashboard to create another tile. The use of multiple tiles lets you have more than one visualization of the same data on your dashboard.

1. Now select the line chart tile on the dashboard. The Power BI service returns you to the report editor where you can refine the visualization:

   :::image type="content" source="media/service-get-started/power-bi-edit-chart.png" alt-text="Screenshot that shows a visualization open in the report editor and the Edit option selected." :::

   Select **Edit** to return to Editing view and continue to explore and pin tiles.

### Create report visuals with Q&A

For a quick exploration of your data, try asking a question in the Q&A question box. Q&A lets you ask natural-language queries about your data.

In the Power BI service, you can find the Q&A question box in two places.

- On a dashboard, the **Ask a question about your data** Q&A box is at the top of the tile view:

   :::image type="content" source="media/service-get-started/dashboard-qna-box.png" alt-text="Screenshot that shows the Q&A question box in the dashboard tile view.":::

- In the report editor, the **Ask a question** Q&A box is in the top menu bar:

   :::image type="content" source="media/service-get-started/report-editor-qna-box.png" alt-text="Screenshot that shows the Q&A question box in the report editor menu bar.":::

When you select the Q&A box, Power BI opens an extended view to help you ask questions and find answers.

Let's try out the Q&A experience for a dashboard.

1. In the Power BI service, select **My workspace**, and then select your dashboard for the Financial Sample.

   :::image type="content" source="media/service-get-started/power-bi-my-workspace.png" alt-text="Screenshot that shows how to return to My workspace and open the Financial Sample dashboard." :::

1. At the top of the tile view, select **Ask a question about your data**. The view expands and Q&A offers several suggestions. 

   :::image type="content" source="media/service-get-started/power-bi-dashboard-qna-expand.png" alt-text="Screenshot that shows the expanded view of Q&A with suggestions.":::

   Select a suggestion and see the results, or enter your own question in the Q&A box.

1. In the Q&A box, enter the question *what is the average sales*. As you type, Q&A tries to pattern match your text entry for recognized questions.

   :::image type="content" source="media/service-get-started/dashboard-qna-ask-question.png" alt-text="Screenshot that shows how Q&A tries to pattern match your text for recognized questions." border="false":::

   Q&A searches for an answer and displays the answer as a *card* visualization.

1. At the top right, select **Pin visual** and pin the visualization to your financial sample dashboard.

   :::image type="content" source="media/service-get-started/dashboard-qna-pin-average-sale.png" alt-text="Screenshot that shows how to pin the Q&A answer visualization to a dashboard." border="false":::

1. Try another question in the Q&A box. Enter *total profit by country as a map*. 

   :::image type="content" source="media/service-get-started/dashboard-qna-country.png" alt-text="Screenshot of the Q&A map visualization of the Financial Sample data for total profit by country and region." border="false":::

1. Pin the country/region map visualization to your financial sample dashboard.

1. In the success dialog, select **Go to dashboard** to view the newly pinned tiles on your dashboard.

1. On the dashboard, select the pinned country/region map. Notice how the visualization opens in Q&A.

1. Place the cursor in the Q&A box at the end of your current query, and enter *as bar*. Power BI creates a bar chart with the results.

   :::image type="content" source="media/service-get-started/dashboard-qna-country-profit-bar.png" alt-text="Screenshot that shows the Q&A bar chart visualization for the Financial Sample country and region data." border="false":::

   The data looks more interesting as a map, so we don't fin this bar chart.

1. At the top, select **Exit Q&A** to return to your dashboard.

You now have five pinned tiles on your dashboard: line chart, card, country/region map, and bar chart.

:::image type="content" source="media/service-get-started/power-bi-completed-dashboard.png" alt-text="Screenshot of the Financial Sample dashboard with pinned Q&A visualization tiles.":::

### Pin different views of data with multiple tiles

Notice that although you changed the map visualization to a bar chart in Q&A, the corresponding tile on the dashboard still shows a map.

When you pin a tile to a dashboard, the tile always displays the data by using the original visualization type. If you change the visualization type for an existing tile, and pin the tile, Power BI creates a new tile with the new visualization type. The original tile remains unchanged. The use of multiple tiles enables you to have more than one visualization of the same data on your dashboard.

## Adjust tile layout on the dashboard

Tiles on the dashboard can be rearranged and adjusted to make better use of the space. You can change tile sizes, reposition tiles, and work with tile details to improve the layout.

### Adjust tile size

In the previous image, the *Sum of Profit* line chart was shortened and the *Average of sales* card was moved and lengthened. Here's how that was done. 

1. Select the lower-right corner of the *Sum of Profit* line chart tile and drag the tile outline upward to reduce the overall tile height.

1. Select and hold the *Average of sales* card as you drag it to a new location. Release and then drag the bottom right corner until it matches the length of the tiles above it.

The two tiles are now the same height.
 
### Modify tile details

Sometimes changing **Tile details** can improve the dashboard presentation. 

:::image type="content" source="media/service-get-started/dashboard-tile-edit-details.png" alt-text="Screenshot that shows how to open the details for a tile on the dashboard.":::

1. On the *Average of Sales* tile, select **More options (...)** > **Edit details**. 

1. In the **Tile details** dialog, in the **Title** box, enter **Sales Average**.

1. Select **Apply**.

## Clean up resources

After you finish the tutorial, it's a good practice to delete the semantic model, report, and dashboard.

When you delete a semantic model, the Power BI service also deletes all reports and dashboard tiles that use data from the semantic model.

1. In the Power BI service, select **My workspace**.

1. Locate the Financial Sample **semantic model**.

1. Select **More options (...)** > **Delete**. Power BI displays a warning message: _All reports and dashboard tiles containing data from this semantic model are also deleted_.

1. Select **Delete**.

## Related content

- [Create quick reports](../create-reports/service-quick-create-report.md) in the Power BI service.
- Learn all about [Microsoft Power BI](/training/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link).
- Become a [Microsoft Certified: Power BI Data Analyst Associate](/certifications/power-bi-data-analyst-associate/).
