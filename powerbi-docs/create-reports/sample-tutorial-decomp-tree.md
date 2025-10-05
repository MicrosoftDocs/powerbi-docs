---
title: "Tutorial: Create a decomposition tree with a Power BI sample"
description: Learn to explore the Retail Analysis sample with a decomposition tree in the Power BI service and Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 10/01/2025
LocalizationGroup: Samples
---
# Tutorial: Create a decomposition tree with a Power BI sample

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you start with a built-in Power BI sample semantic model and create a report with a *decomposition tree*. A decomposition tree is an interactive visual for exploration and conducting root cause analysis. 

A decomposition tree is also an artificial intelligence (AI) visualization. You can ask it to find the next category, or dimension, to drill down into based on certain criteria. For more information, see [Create and view decomposition tree visuals in Power BI](../visuals/power-bi-visualization-decomposition-tree.md).

:::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-final.png" alt-text="Screenshot shows the completed decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-final.png":::

This tutorial shows you how to:

> [!div class="checklist"]
>
> - Sign up for a Power BI license if you don't have one.
> - Import the Retail Analysis sample and add it to the [Power BI service](https://app.powerbi.com).
> - Create a decomposition tree.
> - Do root cause analysis on your data in the decomposition tree in Edit mode.
> - Save the report and continue root cause analysis in reading view.

If you want to get familiar with the built-in sample in this tutorial and its scenario, see [Retail Analysis sample for Power BI: Take a tour](sample-retail-analysis.md) before you start.

## Prerequisites

The prerequisites depend on whether you're using the Power BI service or Power BI Desktop.

### Power BI service (app.powerbi.com)

- You need a [Fabric free license](../consumer/end-user-features.md) to explore samples and save them to your workspace in the [Power BI service](https://app.powerbi.com). [Sign up for a free trial](https://aka.ms/try-fabric) if you don't have access.

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

### Create a report from the semantic model

You have several options for exploring your semantic model. In this tutorial, you're going to explore the semantic model by creating your own report from scratch.

1. Select **More options** (**...**) > **Create report**.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-chart-icon4.png" alt-text="Screenshot shows the Create report menu item." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-chart-icon4.png":::

   The semantic model opens in report editing mode.

   :::image type="content" source="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png" alt-text="Screenshot shows a brand-new report in edit mode." lightbox="media/sample-tutorial-connect-to-the-samples/power-bi-report-editing.png":::

## Create a decomposition tree

Let's add a decomposition tree to our report for analysis.

1. Download the [Retail Analysis Sample .pbix file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. Open the Retail Analysis Sample in Power BI Desktop. The report should open in **Report view**. 

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-visualizations-report-view.png" alt-text="Screenshot shows the report view with the option to choose visualizations." lightbox="media/sample-tutorial-decomp-tree/retail-visualizations-report-view.png":::

1. Under **Build visual** in the **Visualizations** pane, select the **Decomposition tree** icon.

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-visualizations-decomp-tree.png" alt-text="Screenshot shows the Visualizations pane with Decomposition tree selected." lightbox="media/sample-tutorial-decomp-tree/retail-visualizations-decomp-tree.png":::

1. Select the focus mode icon or drag the edge so the visualization fills most of the page. In this example, we're in focus mode. 

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-resize-desktop.png" alt-text="Screenshot shows the resized decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-resize-desktop.png":::

    Decomposition trees can get wide.

1. Expand **Sales** > **This Year Sales** and then select **Value**. Power BI adds the corresponding value to the **Analyze** box. 

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-analyze-sales-desktop.png" alt-text="Screenshot shows Value for This Year Sales added to the Analyze box for the decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-analyze-sales-desktop.png":::

   Decomposition trees analyze one value by many categories, or dimensions. 

1. Next, select each dimension field that you want added to the **Explain by** box. Let's select these fields:

   - **District** > **DM** (District Manager)
   - **Item** > **Category**
   - **Item** > **FamilyNane** (Family Name)
   - **Item** > **Segment**
   - **Store** > **Chain**
   - **Store** > **PostalCode**
   - **Store** > **Store Type**
   - **Store** > **Territory**

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-explain-desktop.png" alt-text="Screenshot shows the fields added to the Explain by box." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-explain-desktop.png":::

   Add as many as you want, in any order. You can use them or not, in any order, in the decomposition tree. 

## Analyze in the decomposition tree

Now comes the analysis part.

1. Select the plus sign (+) next to **This Year Sales** and select **High value**. 

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-select-high-value-desktop.png" alt-text="Screenshot shows High value selected for analysis." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-select-high-value-desktop.png":::

   That means Power BI uses artificial intelligence to analyze all the different categories in the **Explain by** box, and pick the one to drill into to get the highest value of the measure being analyzed.

1. Power BI selects **Store type**.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-store-type.png" alt-text="Screenshot shows Store Type selected by Power BI." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-store-type.png":::

1. Select the plus sign (+) next to **Same Store** and select **High value**. Keep selecting **High value** from the top nodes until you have a decomposition tree that looks like this one.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-complete.png" alt-text="Screenshot shows all the highest values selected by Power BI." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-complete.png":::

   We selected **Same store** > **Chain** > **Territory** > **DM** > **Category**. Or select other values yourself, and see what you end up with.

1. You can delete a dimension by selecting the **X** next to the corresponding heading.

   :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-delete-dimension.png" alt-text="Screenshot showing how to delete a level from the decomposition tree." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-delete-dimension.png":::

1. Save the report by selecting **Share** > **Share** or **Share** > **Copy link**. 

    :::image type="content" source="media/sample-tutorial-decomp-tree/retail-decomp-share.png" alt-text="Screenshot shows the decomposition tree with the options available for This Year Sales." lightbox="media/sample-tutorial-decomp-tree/retail-decomp-share.png":::

Now anyone who views your report can interact with the decomposition tree, starting from the first **This Year Sales** and choosing their own path to follow.

Learn about everything else you can do with decomposition trees in [Create and view decomposition tree visuals in Power BI](../visuals/power-bi-visualization-decomposition-tree.md).

## Related content

> [!div class="nextstepaction"]
> [Tutorial: Explore a Power BI sample](sample-tutorial-connect-to-the-samples.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
