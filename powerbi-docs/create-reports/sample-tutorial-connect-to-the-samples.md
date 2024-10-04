---
title: "Tutorial: Explore a Power BI sample"
description: Learn to install and explore the Retail Analysis sample in the Power BI service and in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 04/03/2023
LocalizationGroup: Samples
---
# Tutorial: Explore a Power BI sample

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI has several samples that you can either download in the Power BI service or open in Power BI Desktop. In a *built-in sample*, the report is bundled with a dashboard and semantic model, and built into the Power BI service. The *.pbix file* that you can view in Power BI Desktop contains a report and semantic model.

:::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-report-overview.png" alt-text="Screenshot showing the Overview page of the Retail Analysis Sample." lightbox="media/sample-tutorial-connect-to-the-samples/retail-report-overview.png":::

This tutorial shows you how to:

> [!div class="checklist"]
>
> - Sign up for a Power BI license, if you don't have one.
> - Import the Retail Analysis sample and add it to the Power BI service.
> - Explore the sample in the service.
> - Create a visual by using natural language in *Q&A*.
> - Generate *quick insights* based on the semantic model.
> - Open the Retail Analysis sample *.pbix* file in Power BI Desktop.

If you'd like more background information, see [Sample semantic models for Power BI](sample-datasets.md). In that article you learn about how to get the samples, where to save them, and how to use them.

If you want to familiarize yourself with the built-in sample in this tutorial and its scenario, see [Retail Analysis sample for Power BI: Take a tour](sample-retail-analysis.md).

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Fabric free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

To open a Power BI *.pbix* file, you need to [get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md). It's a free download.

## Import the sample in the Power BI service

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Retail Analysis Sample**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png" alt-text="Screenshot shows the Power BI Learning center where you can import samples." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png":::

1. Select the sample. It opens in Reading mode.

1. Power BI imports the built-in sample, adding a new dashboard, report, and semantic model to your current workspace.

## What was imported?

With the built-in samples, Power BI gets a copy of that built-in sample and stores it for you in the cloud.

1. Power BI creates the new dashboard, report, and semantic model in your workspace.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-entry.png" alt-text="Screenshot showing the Retail Analysis Sample entry in your workspace." lightbox="media/sample-tutorial-connect-to-the-samples/retail-entry.png"::: ?

1. On the **Content** tab, you see the dashboard and the report, both named *Retail Analysis Sample*.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-new-report.png" alt-text="Screenshot showing the Retail Analysis Sample Content tab with dashboard and report entries." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-new-report.png"::: ?

1. On the **Semantic models + dataflows** tab, you see the semantic model, also named *Retail Analysis Sample*. ?

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png" alt-text="Screenshot showing the Retail Analysis Sample Semantic models + dataflows tab with the semantic model entry." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png":::

## Explore your new content

Now explore the dashboard, semantic model, and report on your own. There are many different ways to navigate to your dashboards, reports, and semantic models. First, let's start from the dashboard.

- If a tile was created by using [Power BI Q&A](#explore-in-qa), the Q&A page opens when you select it.
- If a tile was [pinned from a report](#explore-the-report), the report opens.
- If a tile was pinned from Excel, Excel Online opens inside of Power BI. 

The first two of these methods are described in the following procedures. This tutorial doesn't have any tiles [pinned from Excel](service-dashboard-pin-tile-from-excel.md).

You can also explore the semantic model directly:

- Try [quick insights](#explore-quick-insights).
- Let Power BI [Auto-create a report](#create-a-report-from-the-semantic-model) for you.

### Explore in Q&A

The Q&A feature in the Power BI service lets you explore your data in your own words, asking questions using natural language.

1. From your workspace, select the **Retail Analysis Sample** *dashboard* to open it.

   The dashboard opens, with various visualization tiles.

1. Select the **This Year's Sales, New & Existing Stores** tile, of **$22 M**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales.png" alt-text="Screenshot showing This Year's Sales tile selected." lightbox="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales.png":::

   This tile was created with Power BI Q&A, so when you select the tile, Q&A opens again.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales.png" alt-text="Screenshot showing the tile opened in Q&A with this year's sales." lightbox="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales.png":::

1. In the top bar, next to **this year's sales**, start typing *by store*. Q&A creates a bar chart of values for each store.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales-store.png" alt-text="Screenshot showing adding by store to this year's sales text in the Q&A bar." lightbox="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales-store.png":::

1. In the upper-right corner, select **Pin visual**.

1. Pin your new visual to your existing dashboard, **Retail Analysis Sample**.

1. Select **Exit Q&A**.

   Power BI added your new tile at the end of the dashboard. You can resize it and drag it anywhere you want on the dashboard. You see how the other tiles move to make way for it.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales-store.png" alt-text="Screenshot showing tiles rearranged on the dashboard." lightbox="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales-store.png":::

### Explore the report

1. Select one of the other tiles in the dashboard to open the underlying report. In this example, select the area chart, **This Year's Sales, Last Year's Sales by Fiscal Month**.  

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-dashboards2new.png" alt-text="Screenshot showing Retail Analysis Sample dashboard with This Year's Sales chart highlighted." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-dashboards2new.png":::

   The report opens to the page that contains the area chart you selected, in this case, the **District Monthly Sales** page of the report.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report.png" alt-text="Screenshot showing the District Monthly Sales report page." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report.png":::

1. Check out [Dive deeper into the data](sample-retail-analysis.md#use-qa-to-dig-deeper-in-the-dashboard) in the article "Retail Analysis sample for Power BI: Take a tour" for suggestions on exploring the report.

### Explore quick insights

One easy way of exploring a *semantic model* is to run [quick insights](../consumer/end-user-insights.md).

1. On the **Semantic models + dataflows** tab, select **More options (...)** next to the **Retail Analysis Sample** semantic model, then choose **Get quick insights**.

1. When the insights are ready, select **View insights**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-quick-insights.png" alt-text="Screenshot showing the insights report for the Retail Analysis Sample." lightbox="media/sample-tutorial-connect-to-the-samples/retail-quick-insights.png":::

1. If an insight is interesting, pin it to the dashboard.

### Create a report from the semantic model

On the **Semantic models** tab, you have several options for exploring your semantic model. However, you can't view the rows and columns of your data, as you can in Power BI Desktop or Excel. One way to explore the semantic model is to create a report by using **Auto-create**.

To auto-create a report:

1. In your workspace, select the **Retail Analysis Sample** semantic model to open it.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png" alt-text="Screenshot showing the Retail Analysis Sample semantic model entry in your workspace.":::

1. Select **Create a report**, then **Auto-create**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-auto-create-report.png" alt-text="Screenshot showing the Auto-create report menu item." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-auto-create-report.png":::

   Power BI shows you the new report. Select **Edit** to revise and improve it.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png" alt-text="Screenshot showing a brand-new report in report-editing mode." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png":::

## Download the sample in Power BI Desktop

When you first open the sample *.pbix* file in Power BI Desktop, it displays in *Report* view where you can explore and modify existing report pages and add new ones, with your own visualizations. Report view provides almost the same design experience as report *Editing* view in the Power BI service. You can move visualizations around, copy and paste, change the kind of visualization, and so on.

Unlike editing a report in the Power BI service, in Power BI Desktop you can also work with your queries and model your data to ensure your data supports the best insights in your reports. You can then save your Power BI Desktop file wherever you like, whether it's to your local drive or to the Power BI service.

To download the sample:

1. Download the [Retail Analysis sample .pbix file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) and open it in Power BI Desktop.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-samples-desktop.png" alt-text="Screenshot showing the Retail Analysis sample in Power BI report view." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-samples-desktop.png":::

   The file opens in Report view. There are four tabs at the bottom of the report editor. These tabs represent the four pages in this report. For this example, the **New Stores** page is currently selected.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-sample-tabs.png" alt-text="Screenshot showing the New Stores tab highlighted.":::

1. For a deep dive into the report editor, see [Take a tour of the report editor](service-the-report-editor-take-a-tour.md).

## What's in your report?

When you download a sample *.pbix* file, you've downloaded not just a report but also the *underlying semantic model*. When you open the file, Power BI Desktop loads the data with its associated queries and relationships. You can view the underlying data and relationships, but you can't view the underlying queries in the Query Editor.

To view the underlying data and model:

1. Switch to [Data view](../connect-data/desktop-data-view.md) by selecting the Data view icon :::image type="icon" source="media/sample-tutorial-connect-to-the-samples/power-bi-data-icon.png":::.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-sample-data.png" alt-text="Screenshot showing Data view in Power BI Desktop." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-sample-data.png":::

   In Data view, you can inspect, explore, and understand data in your Power BI Desktop model. It's different from how you view tables, columns, and data in the Query Editor. The data in Data view is already loaded into the model.

   When you're modeling your data, sometimes you want to see what's actually in the rows and columns of a table, without creating a visual on the report canvas. This fact is especially true when you're creating measures and calculated columns, or you need to identify a data type or data category.

1. Switch to [Model view](../transform-model/desktop-relationship-view.md) by selecting the following icon: :::image type="icon" source="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-relationship-icon.png":::.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-relationships.png" alt-text="Screenshot showing Model view in Power BI Desktop." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-relationships.png":::

   Model view shows all of the tables and columns in your model, and the relationships between them. From here you can view, change, and create relationships.

## Related content

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, semantic models, relationships, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md) and [Get started with Power BI Desktop](../fundamentals/desktop-getting-started.md).  

> [!div class="nextstepaction"]
> [Samples for the Power BI service](sample-datasets.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
