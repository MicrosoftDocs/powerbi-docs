---
title: "Tutorial: From Excel workbook to a Power BI report in Microsoft Teams"
description: This article shows how you can quickly create a stunning report in the Power BI service from an Excel workbook, and share it in Teams.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 06/12/2024
LocalizationGroup: Data from files
---
# Tutorial: From Excel workbook to a Power BI report in Microsoft Teams

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Your manager wants to see a report on your latest sales and profit figures by the end of the day. However, the latest data is in files on your laptop. In the past, it's taken hours to create a report, and you’re beginning to feel anxious.

No worries. With Power BI, you can create a stunning report and share it in Microsoft Teams in no time!

:::image type="content" source="media/service-from-excel-to-stunning-report/worldwide-sales-report.png" alt-text="Screenshot of the finished Financial Sample report." lightbox="media/service-from-excel-to-stunning-report/worldwide-sales-report.png":::

In this tutorial, we upload an Excel file, create a new report, and share it with colleagues in Microsoft Teams, all from within Power BI. You'll learn how to:

> [!div class="checklist"]

> * Prepare your data in Excel.
> * Download sample data.
> * Build a report in the Power BI service.
> * Pin the report visuals to a dashboard.
> * Share a link to the dashboard.
> * Share the dashboard in Microsoft Teams

## Prerequisites

- [Sign up for the Power BI service](../fundamentals/service-self-service-signup-for-power-bi.md).
- Download the [Financial Sample workbook](https://go.microsoft.com/fwlink/?LinkID=521962) and save it to your computer or to OneDrive for Business.

## Prepare data in Excel

Let’s take an Excel file as an example.

1. Before you can load your Excel file into Power BI, you must organize your data in a flat table. In a flat table, each column contains the same data type; for example, text, date, number, or currency. Your table should have a header row but no columns or rows that display totals.

   ![Screenshot of the data organized in Excel.](media/service-from-excel-to-stunning-report/pbi_excel_file.png)

1. Next, format your data as a table. In Excel, on the **Home** tab, in the **Styles** group, select **Format as Table**.

1. Select a table style to apply to your worksheet.

   Your Excel worksheet is now ready to load into Power BI.

   ![Screenshot of the data formatted as a table.](media/service-from-excel-to-stunning-report/pbi_excel_table.png)

## Upload your Excel file to the Power BI service

The Power BI service connects to many data sources, including Excel files that live on your computer.

1. To get started, sign in to the Power BI service. If you haven’t signed up, [you can do so for free](https://powerbi.com).

1. In **My workspace**, select **New** > **Report**.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-new-report.png" alt-text="Screenshot of My workspace, highlighting the New dropdown menu and the Report option.":::

1. Select **Excel**.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-select-excel.png" alt-text="Screenshot of My Workspace, highlighting the Excel data source option.":::

1. Select **Upload file**, and drag or browse to the Excel file location.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-query-upload-file.png" alt-text="Screenshot of the Power Query dialog, highlighting the Connect to data source dialog box.":::

    Now you have a Financial Sample semantic model. Power BI also automatically created a blank dashboard. If you don't see the dashboard, refresh your browser.

1. If you aren't signed in, you need to sign in before you can upload the Excel file. Select **Next**.

1. In the Power Query **Choose data** window, select the **financials** table in the Excel workbook, and select **Create**.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-query-choose-data.png" alt-text="Screenshot of Power Query Choose data window, select the financials table." lightbox="media/service-from-excel-to-stunning-report/power-query-choose-data.png":::

## Build your report

The report opens in Editing view and displays the blank report canvas. On the right are the **Filters**, **Visualizations**, and **Data** panes. Your Excel workbook table data appears in the **Data** pane. At the top is the name of the table, **financials**. Under that, Power BI lists the column headings as individual fields.

Notice the Sigma symbols in the Data list? Power BI has detected that those fields are numeric. Power BI can also detect geographic fields and date fields.

![Screenshot of the Data pane, showing Excel columns as fields in the financials table.](media/service-from-excel-to-stunning-report/power-bi-fields-list-financial.png)

1. To have more room for the report canvas, minimize the **Filters** pane.

1. Now you can begin to create visualizations. Let's say your manager wants to see profit over time. In the **Data** pane, drag **Profit** to the report canvas.

   By default, Power BI displays a column chart with one column.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-profit-column.png" alt-text="Screenshot of a column chart with one column.":::

1. Drag **Date** to the column chart.

   Power BI updates the column chart to show profit by years.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-profit-year.png" alt-text="Screenshot of a column chart by year in report editor.":::

1. Hover over the chart and select the forked double arrows to show quarters, then select them again to show months.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-profit-month.png" alt-text="Screenshot of a column chart by month in report editor.":::

   December 2014 was the most profitable month.

    > [!TIP]
    > If your chart values don't look as you expect, check your aggregations. For example, in the **Values** well, select the **Profit** field you just added and make sure the data is being aggregated the way you want. In this example, we're using **Sum**.
    >

### Create a map

Your manager wants to know which countries/regions are the most profitable. Impress your manager with a map visualization.

1. Select a blank area on your report canvas.

2. From the **Data** pane, drag the **Country** field to your report canvas, then drag the **Profit** field to the map.

   Power BI creates a map visual with bubbles representing the relative profit of each location.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-map-visual.png" alt-text="Screenshot of map visual in report editor.":::

    You can see that the European and the North American region profits are about the same.

### Create a visual showing sales segments

What about displaying a visual showing sales by product and market segment? That's easy.

1. Select the blank canvas.

1. In the **Data** pane, select the **Sales**, **Product**, and **Segment** fields.

   Power BI creates a clustered column chart.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-clustered-column.png" alt-text="Screenshot of a clustered column chart in the report editor." lightbox="media/service-from-excel-to-stunning-report/power-bi-clustered-column.png":::

1. Change the type of chart by choosing one of the icons in the **Visualizations** menu. For instance, change it to a **Stacked column chart**.

   :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-stacked-column.png" alt-text="Screenshot of a stacked column chart in the report editor.":::

1. To sort the chart, select **More options** (**...**) > **Sort by**.

### Spruce up the visuals

Make the following changes on the **Format** tab in the Visualizations pane.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-format-tab-visualizations.png" alt-text="Screenshot of the Format tab in the Visualizations pane.":::

1. Select the **Profit by Year, Quarter, Month, and Day** column chart. In the **Title** section, change **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select the **Sales by Product and Segment** stacked column chart. In the **Title** section, change title **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select the **Profit by Country** map. In the **Map styles** section, change **Theme** to **Grayscale**. In the **Title** section, change title **Text size** to **16 pt**. Toggle **Shadow** to **On**.

## Add a report title

1. Select the **Text box** option.

1. Drag the box to the upper-left corner. Type "Worldwide Sales" in the box.

    :::image type="content" source="media/service-from-excel-to-stunning-report/create-text-box.png" alt-text="Screenshot of creating a text box in the report.":::

1. Select the text, and make the **Font size** **36**.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-add-title-worldwide-sales.png" alt-text="Screenshot of formatting the title in the report.":::

## Pin to a dashboard

You can pin all of your visuals to the blank dashboard that Power BI created by default.

1. Hover over a visual and select **Pin visual**.

   ![Screenshot of a visual, highlighting the Pin visual icon.](media/service-from-excel-to-stunning-report/power-bi-pin-visual.png)

1. You must save your report before you can pin a visual to the dashboard. Give your report a name and select **Save**.
1. Pin each visual to the dashboard that Power BI created, **Financial Sample.xlsx**.
1. When you pin the last visual, select **Go to dashboard**.
1. Power BI added a placeholder Financial Sample.xlsx tile to the dashboard automatically. Select **More options (...)** > **Delete tile**.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-tile-more-options.png" alt-text="Screenshot of More options for a tile.":::

1. Rearrange and resize the tiles any way you want.

The dashboard and report are ready.

## Share a link to your dashboard

Now it's time to share your dashboard with your manager. You can share your dashboard and underlying report with any colleague who has a Power BI account. They can interact with your report, but they can't save changes. If you allow it, they can reshare with others or build a new report based on the underlying semantic model.

1. To share your report, at the top of the dashboard, select **Share**.

   ![Screenshot of My workspace, highlighting the Share icon.](media/service-from-excel-to-stunning-report/power-bi-share-dashboard.png)

2. In the **Share dashboard** screen, enter the email addresses of the recipients in the **Enter a name or email addresses** field and add an optional message.

3. Select the option to **Send an email notification**. Choose any other options you want:

    - **Allow recipients to share this dashboard**
    - **Allow recipients to build content with the data associated with this dashboard**

   ![Screenshot of the Share dashboard pane, with all options selected.](media/service-from-excel-to-stunning-report/power-bi-share-dashboard-pane.png)

1. Select **Grant access**.

## Share to Microsoft Teams

You can also share reports and dashboards directly to your colleagues in Microsoft Teams.

1. To share in Teams, at the top of the dashboard, select **Chat in Teams**.

   ![Screenshot of My workspace, highlighting the Chat in Teams option.](media/service-from-excel-to-stunning-report/power-bi-share-teams.png)

2. Power BI displays the **Share to Teams** dialog. Enter the name of a person, group, or channel and select **Share**.

    :::image type="content" source="media/service-from-excel-to-stunning-report/power-bi-share-teams-dialog.png" alt-text="Screenshot of the Share to Teams dialog box.":::

3. The link appears in the **Posts** for that person, group, or channel.

   ![Screenshot of an example post in Microsoft Teams.](media/service-from-excel-to-stunning-report/power-bi-teams-chat.png)

## Related content

* Now that you've created a basic report in the Power BI service, how about creating a report in Power BI Desktop? Try the tutorial, [From Excel workbook to stunning report in Power BI Desktop](desktop-excel-stunning-report.md).

More questions? [Try the Power BI Community](https://community.powerbi.com/).
