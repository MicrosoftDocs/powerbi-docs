---
title: "Tutorial: Create a decomposition tree with a Power BI sample"
description: Learn to explore the Retail Analysis sample with a decomposition tree in the Power BI service and Power BI Desktop.
author: kfollis
ms.author: kfollis
ms.reviewer: 
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 02/28/2023
LocalizationGroup: Samples
---
# Tutorial: Create a decomposition tree with a Power BI sample

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you start with a built-in Power BI sample semantic model and create a report with a *decomposition tree*. A decomposition tree is an interactive visual for ad hoc exploration and conducting root cause analysis. It's also an artificial intelligence (AI) visualization. You can ask it to find the next category, or *dimension*, to drill down into based on certain criteria. For more information, see [Create and view decomposition tree visuals in Power BI](../visuals/power-bi-visualization-decomposition-tree.md).

:::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-final.png" alt-text="Screenshot shows the completed decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-final.png":::

This tutorial shows you how to:

> [!div class="checklist"]
>
> - Sign up for a Power BI license, if you don't have one.
> - Import the Retail Analysis sample and add it to the Power BI service.
> - Create a decomposition tree.
> - Do root cause analysis on your data in the decomposition tree in Edit mode.
> - Save the report and continue root cause analysis in reading view.

If you want to familiarize yourself with the built-in sample in this tutorial and its scenario, see [Retail Analysis sample for Power BI: Take a tour](sample-retail-analysis.md) before you begin.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Fabric free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

To open a Power BI *.pbix* file, you need to [get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md). It's a free download.

## Import the sample in the Power BI service

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Retail Analysis Sample**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png" alt-text="Screenshot shows the Power BI Learning center where you can import samples." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-learn.png":::

1. Select the sample. It opens in Reading mode.

1. Power BI imports the built-in sample, adding a new dashboard, report, and semantic model to your current workspace.

### Create a report from the semantic model

You have several options for exploring your semantic model. In this tutorial, you're going to explore the semantic model by creating your own report from scratch.

:::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png" alt-text="Screenshot shows the Retail Analysis Sample semantic model entry." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-new-dataset.png":::

1. Select **More options** (**...**) > **Create report**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-chart-icon4.png" alt-text="Screenshot shows the Create report menu item.":::

   The semantic model opens in report editing mode.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png" alt-text="Screenshot shows a brand-new report in edit mode." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png":::

## Create a decomp tree

Let's add a decomposition tree, or *decomp* tree, to our report for ad hoc analysis.

1. Open Power BI Desktop and load the Retail Analysis Sample. You can get this sample from [Download original sample Power BI files](sample-datasets.md#download-original-sample-pbix-power-bi-files).

1. Select the **Report** icon to open the Reports view. In the **Visualizations** pane, select the **Decomposition tree** icon.

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-visualizations-decomp-tree.png" alt-text="Screenshot shows the Visualizations pane with Decomposition tree selected.":::

1. Drag the edge so it fills most of the page. Decomposition trees can get wide.

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-resize-desktop.png" alt-text="Screenshot shows the resized decomposition tree.":::

1. Decomp trees analyze one value by many categories, or *dimensions*. Expand **Sales** > **This Year Sales** and select **Value**. Power BI adds **Value** to the **Analyze** box.

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-analyze-sales-desktop.png" alt-text="Screenshot shows Value for This Year Sales added to the Analyze box for the decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-analyze-sales-desktop.png":::

1. Next, select dimension fields and add them to the **Explain by** box. Add as many as you want, in any order. You can use them or not, in any order, in the decomp tree. We added:

   - District Manager
   - Category
   - FamilyName
   - Segment
   - Chain
   - PostalCode
   - Store Type
   - Territory

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-explain-desktop.png" alt-text="Screenshot shows the fields added to the Explain by box.":::

## Analyze in the decomp tree

Now comes the ad hoc analysis part.

1. Select the plus sign (+) next to **This Year Sales** and select **High value**. That means Power BI uses artificial intelligence to analyze all the different categories in the **Explain by** box, and pick the one to drill into to get the highest value of the measure being analyzed.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-select-high-value-desktop.png" alt-text="Screenshot shows High value selected for analysis.":::

   Power BI selects **Store type**.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-store-type.png" alt-text="Screenshot shows Store Type selected by Power BI.":::

1. Keep selecting **High value** until you have a decomp tree that looks like this one.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-complete.png" alt-text="Screenshot shows all the highest values selected by Power BI." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-complete.png":::

   Or select other values yourself, and see what you end up with.

1. You can delete levels by selecting the **X** in the heading.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-delete-dimension.png" alt-text="Screenshot showing how to delete a level from the decomposition tree.":::

1. Save your report. Now anyone who views your report can interact with the decomp tree, starting from the first **This Year Sales** and choosing their own path to follow.

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-reading-view.png" alt-text="Screenshot shows the decomposition tree with the options available for This Year Sales.":::

Learn about everything else you can do with decomp trees in [Create and view decomposition tree visuals in Power BI](../visuals/power-bi-visualization-decomposition-tree.md).

## Related content

> [!div class="nextstepaction"]
> [Tutorial: Explore a Power BI sample](sample-tutorial-connect-to-the-samples.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
