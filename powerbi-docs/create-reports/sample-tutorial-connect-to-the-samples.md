---
title: "Tutorial: Explore a Power BI sample"
description: Learn to install and explore the Retail Analysis sample in the Power BI service and in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.update-cycle: 1095-days
ms.date: 10/01/2025
LocalizationGroup: Samples
---
# Tutorial: Explore a Power BI sample

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI has several built-in samples with a report and semantic model. You can either import them into the [Power BI service (https://app.powerbi.com)](https://app.powerbi.com) or download and open sample files in Power BI Desktop.

:::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-report-overview.png" alt-text="Screenshot showing the Overview page of the Retail Analysis Sample." lightbox="media/sample-tutorial-connect-to-the-samples/retail-report-overview.png":::

This tutorial shows you how to:

> [!div class="checklist"]
>
> - Sign up for a Power BI license if you don't have one.
> - Import the Retail Analysis sample and add it to the [Power BI service](https://app.powerbi.com).
> - Explore the sample in the service.
> - Create a visual by using natural language in *Q&A*.
> - Generate *quick insights* based on the semantic model.
> - Open the Retail Analysis sample *.pbix* file in Power BI Desktop.

If you'd like more background information, see [Sample semantic models for Power BI](sample-datasets.md). In that article you learn about how to get the samples, where to save them, and how to use them.

If you want to familiarize yourself with the built-in sample in this tutorial and its scenario, see [Retail Analysis sample for Power BI: Take a tour](sample-retail-analysis.md).

## Prerequisites

The prerequisites depend on whether you're using the Power BI service or Power BI Desktop.

### Power BI service (app.powerbi.com)

- You need a [Fabric free license](../fundamentals/end-user-features.md) to explore samples and save them to your workspace in the [Power BI service](https://app.powerbi.com). [Sign up for a free trial](https://aka.ms/try-fabric) if you don't have access.

### Power BI Desktop

> [!TIP]
> You don't need a Power BI license to explore the samples in Power BI Desktop. 

- To open a Power BI *.pbix* file, you need to [get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md). It's a free download.
- You need to download the [Retail Analysis Sample .pbix file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

## Import the sample in the Power BI service

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left pane.

1. On the **Learning center** page, under **Sample reports**, scroll by selecting the right arrow until you can select the **Retail Analysis Sample**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png" alt-text="Screenshot shows the Power BI Learning center where you can import samples." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png":::

1. Select the **Retail Analysis Sample**. 

1. Power BI imports a copy of the built-in sample in reading mode into your current workspace. After import, you see a dashboard, report, and semantic model available in your workspace.

    :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-entry.png" alt-text="Screenshot showing the Retail Analysis Sample entry in your workspace." lightbox="media/sample-tutorial-connect-to-the-samples/retail-entry.png":::

Now let's explore the [dashboard](#explore-the-dashboard), reports, and [semantic model](#explore-the-semantic-model).

## Explore the dashboard

There are many different ways to navigate to your dashboards, reports, and semantic models. First, let's start from the dashboard.

See the following sections for ways to explore the sample content via the dashboard:

- [Explore in Q&A](#explore-in-qa)
- [Explore the report](#explore-the-report)

Besides the Q&A and report examples, dashboard tiles can be pinned from other sources. For example, a tile can be [pinned from Excel](/power-bi/create-reports/service-dashboard-pin-tile-from-excel). When you select the tile, Excel Online opens inside of Power BI. This tutorial doesn't have any tiles pinned from Excel.

For more information about dashboards, see [Introduction to dashboards for Power BI designers](service-dashboards.md).

### Explore in Q&A

The Q&A feature in the Power BI service lets you explore your data in your own words, asking questions using natural language.

1. From your workspace, select the **Retail Analysis Sample** *dashboard* to open it.

   The dashboard opens, with various visualization tiles.

1. Find the **This Year's Sales, New & Existing Stores** tile that displays a value of **$22M**.

1. Select the tile directly. Otherwise, select the ellipsis (...) in the upper-right corner of the tile, and then select **Go to Q&A**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales.png" alt-text="Screenshot showing This Year's Sales tile selected." lightbox="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales.png":::

1. This tile was created and [pinned to the dashboard via Power BI Q&A](/power-bi/create-reports/service-dashboard-pin-tile-from-q-and-a), so when you select the tile, you go to the Q&A page.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales.png" alt-text="Screenshot showing the tile opened in Q&A with this year's sales." lightbox="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales.png":::

1. In the text box at the top, enter *by store* after **this year's sales**. Q&A creates a bar chart of values for each store.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales-store.png" alt-text="Screenshot showing adding by store to this year's sales text in the Q&A bar." lightbox="media/sample-tutorial-connect-to-the-samples/retail-q-n-a-this-years-sales-store.png":::

1. In the upper-right corner, select **Pin visual**.

1. Pin your new visual to your existing dashboard, **Retail Analysis Sample**.

1. Select **Exit Q&A**.

   Power BI added your new tile at the end of the dashboard. You can resize it and drag it anywhere you want on the dashboard. You see how the other tiles move to make way for it.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales-store.png" alt-text="Screenshot showing tiles rearranged on the dashboard." lightbox="media/sample-tutorial-connect-to-the-samples/retail-dashboard-this-years-sales-store.png":::

### Explore the report

If a tile was [pinned from a report](/power-bi/create-reports/service-dashboard-pin-live-tile-from-report), the report opens when you select it.

1. Select one of the other tiles in the dashboard. In this example, select the area chart, **This Year's Sales, Last Year's Sales by Fiscal Month**. The underlying report opens.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-dashboards2new.png" alt-text="Screenshot showing Retail Analysis Sample dashboard with This Year's Sales chart highlighted." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-dashboards2new.png":::

1. The report opens to the page that contains the area chart you selected, in this case, the **District Monthly Sales** page of the report.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report.png" alt-text="Screenshot showing the District Monthly Sales report page." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report.png":::

1. Check out [Dive deeper into the data](sample-retail-analysis.md#use-qa-to-dig-deeper-in-the-dashboard) in the article "Retail Analysis sample for Power BI: Take a tour" for suggestions on exploring the report.

## Explore the semantic model

In this tutorial, you can also explore the semantic model directly:

- Try [quick insights](#explore-quick-insights).
- Let Power BI [Auto-create a report](#create-a-report-from-the-semantic-model) for you.

### Explore quick insights

One easy way of exploring a semantic model is to run [quick insights](../explore-reports/end-user-insights.md).

1. In your workspace, find the **Retail Analysis Sample** semantic model.
1. Select the ellipsis (**...**) for more options to explore the semantic model.

    :::image type="content" source="media/sample-tutorial-connect-to-the-samples/semantic-model-more-options.png" alt-text="Screenshot showing the ellipsis menu with more options to explore the semantic model." lightbox="media/sample-tutorial-connect-to-the-samples/semantic-model-more-options.png":::

1. Then select **Get quick insights**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/semantic-model-get-quick-insights.png" alt-text="Screenshot showing the Get quick insights option for the Retail Analysis Sample." lightbox="media/sample-tutorial-connect-to-the-samples/semantic-model-get-quick-insights.png":::

1. When the insights are ready, select **View insights** from the notification dialog that appears.

1. Review the insights that Power BI generated.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/retail-quick-insights.png" alt-text="Screenshot showing the insights report for the Retail Analysis Sample." lightbox="media/sample-tutorial-connect-to-the-samples/retail-quick-insights-zoom.png":::

1. If an insight is of interest, you can pin it to the dashboard.

### Create a report from the semantic model

On the **Semantic models** tab, you have several options for exploring your semantic model. However, you can't view the rows and columns of your data, as you can in Power BI Desktop or Excel. One way to explore the semantic model is to create a report by using **Auto-create**.

To auto-create a report:

1. In your workspace, select the **Retail Analysis Sample** semantic model to open it.

1. From the **Discover business insights** pane, select **Explore this data** > **Auto-create a report**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-auto-create-report.png" alt-text="Screenshot showing the Auto-create report menu item." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-auto-create-report.png":::

1. Select some data from the list of available fields. For example, under **Store** select **Count of rows** and **Territory**.

1. Select **Edit** to revise and improve the report. 

    :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png" alt-text="Screenshot showing a brand-new report in report-editing mode." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png":::

    > [!NOTE]
    > When you switch to edit mode, you lose access to **Your data** pane.

## Download the sample in Power BI Desktop

When you first open the sample *.pbix* file in Power BI Desktop, it displays in *Report* view where you can explore and modify existing report pages and add new ones, with your own visualizations. Report view provides almost the same design experience as report *Editing* view in the Power BI service. You can move visualizations around, copy and paste, change the kind of visualization, and so on.

> [!NOTE]
> You might be prompted to convert Bing Maps visuals to Azure Maps. You should upgrade because Bing Maps is being deprecated. 
>
> For a comprehensive understanding of Azure Maps, including how to get started, what data is sent to Azure, and the service's limitations, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started).

Unlike editing a report in the Power BI service, in Power BI Desktop you can also work with your queries and model your data to ensure your data supports the best insights in your reports. You can then save your Power BI Desktop file wherever you like, whether it's to your local drive or to the Power BI service.

To download the sample:

1. Download the [Retail Analysis sample .pbix file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. Open the sample *Retail Analysis Sample PBIX.pbix* in Power BI Desktop. 

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-samples-desktop.png" alt-text="Screenshot showing the Retail Analysis sample in Power BI report view." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-samples-desktop.png":::

   The file opens in Report view. There are four tabs at the bottom of the report editor. These tabs represent the four pages in this report. 

1. Select the **New Stores** page.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-sample-tabs.png" alt-text="Screenshot showing the New Stores tab highlighted.":::

1. For a deep dive into the report editor, see [Take a tour of the report editor](service-the-report-editor-take-a-tour.md).

## What's in your report?

The downloaded sample *.pbix* file includes not just a report but also the underlying semantic model. When you open the file, Power BI Desktop loads the data with its associated queries and relationships. 

> [!NOTE]
> You can view the underlying data and relationships, but you can't view the underlying queries in the Query Editor.

To view the underlying data and model:

1. Switch to [Table view](../connect-data/desktop-data-view.md) by selecting the Table view icon: :::image type="icon" source="media/sample-tutorial-connect-to-the-samples/power-bi-data-icon.png":::

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-sample-data.png" alt-text="Screenshot showing Table view in Power BI Desktop." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-sample-data.png":::

   In Table view, you can inspect, explore, and understand data in your Power BI Desktop model. It's different from how you view tables, columns, and data in the Query Editor. The data in Table view is already loaded into the model.

   When you're modeling your data, sometimes you want to see what's actually in the rows and columns of a table, without creating a visual on the report canvas. This fact is especially true when you're creating measures and calculated columns, or you need to identify a data type or data category.

1. Switch to [Model view](../transform-model/desktop-relationship-view.md) by selecting the model view icon: :::image type="icon" source="media/sample-tutorial-connect-to-the-samples/power-bi-desktop-relationship-icon.png":::

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-relationships.png" alt-text="Screenshot showing Model view in Power BI Desktop." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-relationships.png":::

   Model view shows all of the tables and columns in your model, and the relationships between them. From here you can view, change, and create relationships.

## Related content

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

This tutorial showed how Power BI dashboards, semantic models, relationships, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md) and [Get started with Power BI Desktop](../fundamentals/desktop-getting-started.md).  

> [!div class="nextstepaction"]
> [Samples for the Power BI service](sample-datasets.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
