---
title: Create and use funnel charts in Power BI
description: Learn how to work with Funnel charts in Power BI Desktop and the Power BI service.
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
ms.custom: video-qKRZPBnaUXM, sample-opportunityanalysissample
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/28/2023
LocalizationGroup: Visualizations
---

# Create and use funnel charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A funnel chart helps you visualize a linear process that has sequential, connected stages. A common use for a funnel chart is to track sales customers through stages, such as Lead \> Qualified Lead \> Prospect \> Contract \> Close.  At a glance, the shape of the funnel conveys the health of the process you're tracking.

Each funnel stage represents a percentage of the total. In most cases, a funnel chart is shaped like a funnel where the first stage is the largest and each subsequent stage is smaller than its predecessor. A pear-shaped funnel is also useful and can help identify a problem in the process. Typically, the first stage (called the _intake_ stage) is the largest.

:::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-funnel-plain.png" alt-text="Diagram that shows a sample blue funnel.":::

Funnel charts support many capabilities, such as sorting and displaying multiples. You can highlight and cross-filter data in a funnel chart by selecting data on other visualizations on the same report page and vice versa.

## When to use a funnel chart

Funnel charts are a great choice for many scenarios:

- Chart the progress of sequential data through at least four stages.
- Chart items where the amount in the first stage is expected to be greater than the amount in the final stage.
- Calculate potential, such as for revenue, sales, deals, and so on, by stages.
- Calculate and track conversion and retention rates.
- Reveal bottlenecks in a linear process.
- Track the workflow for a shopping cart.
- Track the progress and success of click-through advertising and marketing campaigns.

Watch the following video to see how to create a funnel chart by using data from the Sales and Marketing sample.

> [!VIDEO https://www.youtube.com/embed/qKRZPBnaUXM]

> [!NOTE]  
> The video might use earlier versions of Power BI Desktop or the Power BI service.

## Prerequisites

Review the following prerequisites for using funnel charts in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Opportunity Analysis Sample .pbix file.

1. Download the [Opportunity Analysis Sample .pbix file](https://download.microsoft.com/download/9/1/5/915ABCFA-7125-4D85-A7BD-05645BD95BD8/Opportunity%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Opportunity Analysis Sample** .pbix file, and then select **Open**.

   The **Opportunity Analysis Sample** .pbix file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Opportunity Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Opportunity Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-opportunity-analysis-sample.png" alt-text="Screenshot that shows the Opportunity Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-funnel-charts/power-bi-opportunity-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Create a basic funnel chart

Let's create a funnel chart to show the number of opportunities in each sales stage in the Opportunity Analysis Sample data.

1. On the **Data** pane, expand **SalesStage** and select the **Sales Stage** checkbox. By default, Power BI creates a table visual to display the data.

   :::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-select-field.png" alt-text="Screenshot that shows how to select the Sales Stage field on the Data pane in Power BI Desktop.":::

   You can now convert the table visual into a funnel chart.

1. Select the table visual, and then select **Funnel** on the **Visualizations** pane. Power BI converts the visual type to a funnel chart.

1. On the **Fields** pane, expand **Fact** and select the **Opportunity Count** checkbox.

   Power BI updates the funnel chart and the **Visualizations** pane. The **Opportunity Count** field is added to the **Values** option and the **Sales Stage** field is added to the **Category** option.

   :::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-funnel-chart.png" alt-text="Screenshot that shows how to convert the visual to a funnel chart and add another data field.":::

1. When you hover over a bar in the chart, Power BI displays the details for that data. Hover over the **Proposal** bar.

   Some of the details include:
   - The name of the stage.
   - The number of opportunities currently in this stage.
   - The overall conversion rate (% of Lead).
   - The stage-to-stage value (also known as the _Drop Rate_), which is the percentage of the previous stage. In our example, the stage-to-stage value equals **Proposal Stage**/**Solution Stage**.

   :::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-funnel-hover.png" alt-text="Screenshot that shows how to hover over a bar in a funnel chart to see details about the data." border="false":::

1. Save the report.

## Use highlighting and cross-filtering

Highlighting a bar in a funnel chart cross-filters the other visualizations on the same report page and vice versa. To follow along, add a few more visuals to the report page that contains the funnel chart.

On the funnel chart visual, select the **Proposal** bar. This action cross-highlights the related data in the other visualizations on the report page. You can use CTRL (+ select) to select multiple bars in the chart.

:::image type="content" source="media/power-bi-visualization-funnel-charts/power-bi-funnel-cross-filter.png" alt-text="Screenshot of two bars selected in the funnel chart and cross-highlights and cross-filters on other visuals on the page." border="false":::

For information about setting preferences to cross-highlight and cross-filter multiple visuals, see [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).

For information about working with the **Filters** pane in Power BI, see [Add a filter to a report in Power BI](../create-reports/power-bi-report-add-filter.md).

## Related content

- Create [radial gauge charts in Power BI](power-bi-visualization-radial-gauge-charts.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
