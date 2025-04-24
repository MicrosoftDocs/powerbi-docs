---
title: Create a Q&A visual in a dashboard
description: Learn to create a Q&A visual in a dashboard in the Power BI service by using the Retail Analysis sample.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 10/22/2024
LocalizationGroup: Ask questions of your data
#customer intent: As a Power BI user I want to learn how to create question and answer visuals in Power Bi.
---

# Create a Q&A visual in a dashboard in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Sometimes the fastest way to get an answer from your data is to ask a question using natural language. In this article, we look at two different ways of creating the same visualization: first, asking a question with Q&A in a dashboard, and second, building it in a report. We use the Power BI service to build the visual in the report, but the process is almost identical using Power BI Desktop.

:::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-qna-create-visual.png" alt-text="Screenshot showing a sample filled-area chart.":::

## Prerequisites

- You just need a [Fabric free license](../consumer/end-user-features.md) to edit dashboards in My Workspace in the Power BI service.
- You need a Power BI Pro license to edit dashboards in other workspaces in the Power BI service. Read about [Power BI Pro licenses](../fundamentals/service-self-service-signup-purchase-for-power-bi.md). You also need at least a Contributor role in that workspace. Read about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- To follow along, you must use a report that you can edit, use one of the samples available with Power BI.

## Create a Q&A visual in a dashboard

How would we go about creating this line chart using Q&A?

1. Get the [Retail Analysis Sample](sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service) in the Power BI service.

1. Open the Retail Analysis Sample dashboard and place your cursor in the Q&A box, **Ask a question about your data**.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-qna-cursor-in-qna-box-2.png" alt-text="Screenshot highlighting the Power BI Q&A box.":::

1. In the Q&A box, type something like this question:

    **this year sales and last year sales by month as area chart**

    As you type your question, Q&A picks the best visualization to display your answer. The visualization changes dynamically as you modify the question. Also, Q&A helps you format your question with suggestions, autocomplete, and spelling corrections. Q&A recommends a small wording change: "this year sales and last year sales by *time month* as area chart".

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-qna-corrected-create-filled-chart.png" alt-text="Screenshot showing the Q&A box with corrected wording.":::

1. Select the sentence to accept the suggestion.

   When you finish typing your question, the result is the same chart that you see in the dashboard.

   :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-qna-create-filled-chart.png" alt-text="Screenshot showing the filled-area chart resulting from the Q&A entry.":::

1. To pin the chart to your dashboard, select **Pin visual**.

## Create the same visual in the report editor

Use the following steps to create the same visual in the report editor:

## Power BI Desktop

1. Download the [Retail Analysis Sample](sample-retail-analysis.md#get-the-pbix-file-for-this-sample) .pbix file, and open it in Power BI Desktop.

1. Select the **Report** icon to open the Reports view.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-report-view-2.png" alt-text="Screenshot showing the Report icon to open the Reports view.":::

1. At the bottom of the page, select **District Monthly Sales**.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-desktop-report-visual-2.png" alt-text="Screenshot showing the chart tile for Last Year Sales and This Year Sales in Reports view.":::

## Power BI service

1. Go back to the Retail Analysis Sample dashboard.

1. The dashboard contains the same area chart tile for "Last Year Sales and This Year Sales." Select this tile. The original area chart tile was created in a report, so the report opens to the page that contains this visualization.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-dashboard.png" alt-text="Screenshot showing the Retail Analysis sample dashboard.":::

    > [!TIP]
    > Don't select the tile you created with Q&A. Selecting it opens Q&A.

1. Open the report in Editing view by selecting **Edit**. If you aren't the owner of a report, you can't open the report in Editing view.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-edit-report.png" alt-text="Screenshot showing the Edit report button.":::

1. Select the area chart and review the settings in the **Fields** pane. The report creator built this chart by selecting these three values (**Last Year Sales** and **This Year Sales > Value** from the **Sales** table, and **FiscalMonth** from the **Time** table) and organizing them in the **Axis** and **Values** wells of the **Visualizations** pane.

    :::image type="content" source="media/power-bi-visualization-introduction-to-q-and-a/power-bi-desktop-visualizations-2.png" alt-text="Screenshot showing the Visualization pane.":::

You see they ended up with the same visual. Creating it this way wasn't too complicated, but creating it with Q&A was easier!

## Related content

- [Use Power BI Q&A to explore your data and create visuals](power-bi-tutorial-q-and-a.md)
- [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)
- [Make Excel data work well with Q&A in Power BI](service-prepare-data-for-q-and-a.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
