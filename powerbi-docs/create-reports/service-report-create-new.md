---
title: 'Create a report from an Excel file in the Power BI service '
description: Learn how to create a Power BI report from an Excel file in the Power BI service by using the Retail Analysis sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Create a report from an Excel file
ms.topic: how-to
ms.date: 04/03/2023
LocalizationGroup: Reports
---
# Create a report from an Excel file in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You've read [Reports in Power BI](../consumer/end-user-reports.md) and now you want to create your own. There are different ways to create a report. In this article, we start by creating a basic report in the Power BI service from an Excel file. Once you understand the basics of creating a report, check out the [Related content](#related-content) for more articles.

## Prerequisites

* [Sign up for the Power BI service](../fundamentals/service-self-service-signup-for-power-bi.md).

## Import the Excel file

This method of creating a report starts with a file and a blank report canvas. If you want to follow along, download the [Retail Analysis sample Excel file](https://go.microsoft.com/fwlink/?LinkId=529778) and save it to your computer or to OneDrive for work or school.

1. In the navigation pane, select **My Workspace**. Then select **New** > **Semantic model**.

    :::image type="content" source="media/service-report-create-new/power-bi-select-my-workspace.png"? alt-text="Screenshot of the Power BI service, highlighting New and Semantic model.":::

1. Select **Excel**.

    :::image type="content" source="media/service-report-create-new/power-bi-excel.png" alt-text="Screenshot of the Add data to get started dialog, highlighting Excel.":::

1. Select **Browse this device**. Go to the location where you saved the Retail Analysis sample then select **Open**.

    :::image type="content" source="media/service-report-create-new/power-bi-select-files.png" alt-text="Screenshot of Select a file dialog, highlighting the Retail Analysis Sample.":::

    After the Excel file imports, it's listed as a *semantic model* in the workspace list.

1. Next to the semantic model, select **More options (...)**, and then choose **Create report**.

    :::image type="content" source="media/service-report-create-new/power-bi-dataset-create-report.png" alt-text="Screenshot of My workspace, highlighting more options and Create report.":::

1. The report editor opens.

    :::image type="content" source="media/service-report-create-new/power-bi-blank-report.png" alt-text="Screenshot of the Power BI service report editor." lightbox="media/service-report-create-new/power-bi-blank-report.png":::

> [!TIP]
> Select the menu icon to hide the navigation pane to give you more room.
>
> :::image type="content" source="media/service-report-create-new//power-bi-hide-navigation-pane.png" alt-text="Screenshot highlighting the Hide the navigation pane icon.":::

## Add a radial gauge to the report

Now that our semantic model is imported, let's start answering some questions. Our Chief Marketing Officer (CMO) wants to know how close the company is to meeting this year's sales goals. Learn how a gauge is a good visualization choice for displaying this type of information with [Visualizations in Power BI reports](../visuals/power-bi-report-visualizations.md).

1. In the Data pane, select **Sales** > **This Year Sales** > **Total Sales Variance**.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step1.png" alt-text="Screenshot of the report editor, highlighting the Data pane, Sales, This Year Sales, and Value.":::

1. Convert the visual to a gauge by selecting the gauge template icon :::image type="icon" source="media/service-report-create-new/powerbi-gauge-icon.png"::: from the **Visualizations** pane.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step2.png" alt-text="Screenshot of the visual and the Visualizations pane, highlighting the Gauge template icon.":::

1. Drag **Sales** > **This Year Sales** > **Goal** to the **Target value** well. Looks like we're close to our goal.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step3.png" alt-text="Screenshot of the Visualizations and Data panes, highlighting Target value and Goal.":::

1. Now would be a good time to save your report.

    :::image type="content" source="media/service-report-create-new/powerbi-save.png" alt-text="Screenshot highlighting the Save this report option.":::

## Add an area chart and slicer to the report

Our CMO has other questions for us to answer. They'd like to know how sales this year compare to last year. They'd also like to see the findings by district.

1. First, let's make some room on our canvas. Select the gauge and move it into the top-right corner. Then grab and drag one of the corners and make it smaller.

1. Deselect the gauge. In the Data pane, select **Sales** > **This Year Sales** > **Value** and select **Sales** > **Last Year Sales**.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step4.png" alt-text="Screenshot of the visualization with Last Year Sales and Value selected in the Data pane.":::

1. Convert the visual to an Area chart by selecting the Area chart template :::image type="icon" source="media/service-report-create-new/power-bi-areachart-icon.png"::: from the **Visualizations** pane.

1. Select **Time** > **Period** to add it to the **X-Axis** well.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step5.png" alt-text="Screenshot of the Visualizations pane, highlighting Period in the X axis.":::

1. To sort the visualization by time period, select the ellipses and choose **Sort by Period**.

1. Now let's add the slicer. Select an empty area on the canvas and choose the Slicer :::image type="icon" source="media/service-report-create-new/power-bi-slicer-icon.png"::: template. We now have an empty slicer on our canvas.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step6.png" alt-text="Screenshot showing an empty slicer on the canvas.":::

1. From the Data pane, select **District** > **District**. Move and resize the slicer.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step7.png" alt-text="Screenshot of the slicer, highlighting District in the Visualizations pane.":::

1. Use the slicer to look for patterns and insights by District.

    :::image type="content" source="media/service-report-create-new/power-bi-slicer-video2.gif" alt-text="Animation showing the results of different selections with the slicer.":::

Continue exploring your data and adding visualizations. When you find especially interesting insights, learn how to pin them to a dashboard with [Create a Power BI dashboard from a report](service-dashboard-create.md).

## Related content

* [Create a Power BI dashboard from a report](service-dashboard-create.md)
* [Change settings for Power BI reports](power-bi-report-settings.md)
* More questions? [Ask the Power BI Community](https://community.powerbi.com/)
