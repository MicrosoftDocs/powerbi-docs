---
title: 'Create a report from an Excel file in the Power BI service '
description: Learn how to create a Power BI report from an Excel file in the Power BI service by using the Retail Analysis sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/28/2023
LocalizationGroup: Reports
---
# Create a report from an Excel file in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You've read [Reports in Power BI](../consumer/end-user-reports.md) and now you want to create your own. There are different ways to create a report. In this article, we start by creating a basic report in the Power BI service from an Excel file. Once you understand the basics of creating a report, check out the [Next steps](#next-steps) at the end for more advanced report topics.  

## Prerequisites

* [Sign up for the Power BI service](../fundamentals/service-self-service-signup-for-power-bi.md).

## Import the Excel file

This method of creating a report starts with a file and a blank report canvas. If you want to follow along, download the [Retail Analysis sample Excel file](https://go.microsoft.com/fwlink/?LinkId=529778) and save it to your computer or to OneDrive for work or school.

1. In the navigation pane, select **My Workspace**. Then select **New** > **Dataset**

   :::image type="content" source="media/service-report-create-new/power-bi-select-my-workspace-2.png" alt-text="Screenshot of selecting My Workspace.":::

1. Select **Excel**.

   :::image type="content" source="media/service-report-create-new/power-bi-excel.png" alt-text="Get data":::

1. Select **Browse this device**. Go to the location where you saved the Retail Analysis sample then select **Open**

    :::image type="content" source="media/service-report-create-new/power-bi-select-files-2.png" alt-text="select Files":::

1. Select **Browse this device**, then select **Retail Analysis Sample** > **Open**.

   :::image type="content" source="media/service-report-create-new/power-bi-import.png" alt-text="select Import":::

1. Select **Open**.

   Once the Excel file is imported, it's listed as a *dataset* in the workspace list.

1. Select **More options (...)** next to the dataset, and select **Create report**.

   :::image type="content" source="media/service-report-create-new/power-bi-dataset-create-report.png" alt-text="Screenshot of selecting Create report.":::

1. The report editor opens.

   :::image type="content" source="media/service-report-create-new/power-bi-blank-report.png" alt-text="Screenshot of the report editor.":::

> [!TIP]
> Select the menu icon to hide the navigation pane, to give you more room.
>
> :::image type="content" source="../media/power-bi-hide-navigation-pane.png" alt-text="Screenshot of Select the menu icon to hide the navigation pane.":::

## Add a Radial Gauge to the report

Now that our dataset is imported, let's start answering some questions.  Our Chief Marketing Officer (CMO) wants to know how close we are to meeting this year's sales goals. A Gauge is a [good visualization choice](../visuals/power-bi-report-visualizations.md) for displaying this type of information.

1. In the Fields pane, select **Sales** > **This Year Sales** > **Value**.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step1.png" alt-text="bar chart in report editor":::

1. Convert the visual to a Gauge by selecting the Gauge template :::image type="icon" source="media/service-report-create-new/powerbi-gauge-icon.png"::: from the **Visualizations** pane.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step2.png" alt-text="Gauge visual in report editor":::

1. Drag **Sales** > **This Year Sales** > **Goal** to the **Target value** well. Looks like we're very close to our goal.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step3.png" alt-text="Gauge visual with Goal as Target value":::

1. Now would be a good time to save your report.

   :::image type="content" source="media/service-report-create-new/powerbi-save.png" alt-text="File menu":::

## Add an area chart and slicer to the report

Our CMO has some additional questions for us to answer. They'd like to know how sales this year compare to last year. And, they'd like to see the findings by district.

1. First, let's make some room on our canvas. Select the Gauge and move it into the top-right corner. Then grab and drag one of the corners and make it smaller.

1. Deselect the gauge. In the Fields pane, select **Sales** > **This Year Sales** > **Value** and select **Sales** > **Last Year Sales**.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step4.png" alt-text="report editor with Gauge and bar chart":::

1. Convert the visual to an Area chart by selecting the Area chart template :::image type="icon" source="media/service-report-create-new/power-bi-areachart-icon.png"::: from the **Visualizations** pane.

1. Select **Time** > **Period** to add it to the **Axis** well.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step5.png" alt-text="report editor with Area chart active":::

1. To sort the visualization by time period, select the ellipses and choose **Sort by Period**.

1. Now let's add the slicer. Select an empty area on the canvas and choose the Slicer :::image type="icon" source="media/service-report-create-new/power-bi-slicer-icon.png"::: template. We now have an empty slicer on our canvas.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step6.png" alt-text="report canvas":::

1. From the Fields pane, select **District** > **District**. Move and resize the slicer.

    :::image type="content" source="media/service-report-create-new/power-bi-report-step7.png" alt-text="Report editor, add District":::

1. Use the slicer to look for patterns and insights by District.

   :::image type="content" source="media/service-report-create-new/power-bi-slicer-video2.gif" alt-text="video of using slicer":::

Continue exploring your data and adding visualizations. When you find especially interesting insights, [pin them to a dashboard](service-dashboard-create.md).

## Next steps

* [Pin visualizations to a dashboard](service-dashboard-create.md)
* [Change report settings in the Power BI service](power-bi-report-settings.md)
* More questions? [Ask the Power BI Community](https://community.powerbi.com/)
