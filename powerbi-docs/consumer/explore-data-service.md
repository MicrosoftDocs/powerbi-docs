---
title: "Explore your data in the Power BI service (preview)"
description: In this article, you learn how to explore your data in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 03/13/2024
---

# Explore your data in the Power BI service (preview)

In Power BI, sometimes you just want to do some ad hoc exploration of your data. Maybe you're an analyst who just got access to a new semantic model or data source, and you want to spend time learning about it before you build a report off it. Or maybe you're a business user who needs to answer a specific question about the data to include in a PowerPoint presentation, but the report you’re using doesn’t answer your exact question. Creating a new report from scratch in these cases is a big hurdle, when you just need a quick answer or screenshot for a slide deck.

:::image type="content" source="media/explore-data-service/explore-matrix-plus-visual.png" alt-text="Screenshot showing exploring a matrix and a visual." lightbox="media/explore-data-service/explore-matrix-plus-visual.png":::

Introducing the public preview of the new Explore feature, where you have a lightweight and focused experience to explore your data. Similar to exporting your data and building a PivotTable in Excel, now directly within Power BI you can quickly launch Explore to begin creating a pair of a matrix and a visual to get the answers you need without all the extra complexity of reports.  

## Get started 

1. [Find a dataset or report](#1-find-a-dataset-or-report-youd-like-to-explore) you’d like to explore.

1. [Have Copilot write an overview of the data](#2-create-an-overview-of-the-data-with-copilot)

1. [Begin exploring by building your matrix or PivotTable](#3-begin-exploring-by-building-your-matrix-or-visual) by adding fields from the data pane.

    > [!NOTE]
    > A matrix is like a [PivotTable in Excel](https://support.microsoft.com/office/create-a-pivottable-to-analyze-worksheet-data-a9a84538-bfe9-40a9-a8e9-f99134456576).

1. [Add filters if you need them](#4-add-filters-if-you-need-them). 

1. [Save and share your exploration](#5-save-and-share-your-exploration). 

## 1. Find a dataset or report you’d like to explore

For a given dataset, report, or datamart, begin your exploration by selecting the **More options (…)** menu from a workspace list or the data hub list view. 

:::image type="content" source="media/explore-data-service/more-options-explore-data.png" alt-text="Screenshot showing selecting Explore this data.":::

You also see this option in the Data hub details page as part of the **Discover business insights** action card: 

:::image type="content" source="media/explore-data-service/discover-business-insights.png" alt-text="Screenshot showing Explore this data to discover business insights.":::

### In a report

Or you may want to explore the underlying data behind a report. You can begin exploration from the report **More options (…)** menu in a workspace list, or the **Explore this data** option on the report menu bar.

:::image type="content" source="media/explore-data-service/explore-data-report-menu-bar.png" alt-text="Screenshot showing Explore this data option on the menu bar.":::

### In a datamart

What if while working with a datamart, you’d like to visualize and explore the subset of the data produced from an ad-hoc query you just ran. You have the option to use the new **Explore** feature to dig into your query results as well. 

:::image type="content" source="media/explore-data-service/sql-query-explore-data.png" alt-text="Screenshot showing Explore this data for a SQL query.":::

## 2. Create an overview of the data with Copilot

1. Select **Data overview** > **Create with Copilot**.

    :::image type="content" source="media/explore-data-service/create-data-overview-copilot.png" alt-text="Screenshot showing select Create with Copilot.":::

    Copilot creates a paragraph describing the data.

    :::image type="content" source="media/explore-data-service/copilot-paragraph-overview.png" alt-text="Screenshot showing the paragraph Copilot created.":::

## 3. Begin exploring by building your matrix or visual 

Regardless of where you start from, when you launch the explore experience you land in the new focused view. Your data is on the right, and you can edit, drag and drop, or select fields to start building a matrix or visual.  

:::image type="content" source="media/explore-data-service/begin-exploration.png" alt-text="Screenshot showing the Explore window opened." lightbox="media/explore-data-service/begin-exploration.png":::

From a dataset, the Explore experience starts with a matrix. That's often a first step, to explore by building out a matrix or PivotTable, to better understand what’s available or get down to the right subset of data before visualizing. On the other hand, if you're coming from a datamart, you’re coming from a grid view of the data already, so you start off with a visual instead.  

You can expand the visual representation of the matrix on the lower part of the dialog. This visual maps to the same data as what you show in the matrix. As you modify the fields you're  exploring, it automatically updates and selects the best visual for that set of fields.  

:::image type="content" source="media/explore-data-service/explore-matrix-plus-visual.png" alt-text="Screenshot showing exploring a matrix and a visual with the same data." lightbox="media/explore-data-service/explore-matrix-plus-visual.png" :::

If you prefer, you can swap the layout to show the visual and matrix side by side instead of one on top of the other by using the layout buttons in the top right to adjust the orientation.  

:::image type="content" source="media/explore-data-service/change-layout-view.png" alt-text="Screenshot showing switching the layout to side by side." lightbox="media/explore-data-service/change-layout-view.png":::

To adjust which fields are located on the rows and columns, use the field wells in the **Rearrange data** section of the data pane. You only see the field wells of one visual, either the chart or the matrix.  

:::image type="content" source="media/explore-data-service/rearrange-data-columns-rows.png" alt-text="Screenshot showing rearranging either the visual or the matrix.":::

To see the other field wells, select the visual you want to edit. You know which one you’re editing by the black outline. 

:::image type="content" source="media/explore-data-service/rearrange-data-visual-black-outline.png" alt-text="Screenshot showing modifying the section with the black border." lightbox="media/explore-data-service/rearrange-data-visual-black-outline.png":::

Just as when you were editing the matrix and the visual updated automatically, as you edit the visual, your matrix updates to reflect the same data. This update applies not only to the fields used, but also interactions like sorting and drilling. Assuming the visual can accurately reflect the sort or drill state, it updates appropriately.  

For example, these visuals have a date hierarchy and you want to drill down to quarters. 

:::image type="content" source="media/explore-data-service/drill-down-next-level.png" alt-text="Screenshot showing drilling down to the next level in the chart." lightbox="media/explore-data-service/drill-down-next-level.png":::

When you do so on the visual, the matrix also updates accordingly.

:::image type="content" source="media/explore-data-service/drill-down-quarter-chart-matrix.png" alt-text="Screenshot showing chart drilled down to the quarter level." lightbox="media/explore-data-service/drill-down-quarter-chart-matrix.png" :::

> [!NOTE]
> Certain matrix configurations can't currently be visualized in other chart types. Depending on the situation, a visual may not be rendered or the sort and drill state may not apply. For example, if you expand one specific row in the matrix, that won't apply in the visual, because that interaction within other visual types isn't currently supported.  

## 4. Add filters if you need them

As you build out your exploration, you can also take advantage of a new filtering experience. Select the **Add filter** button on the top left to quickly add filters on the fields already in your visual or pick from any fields in your dataset in the **All data** section.  

:::image type="content" source="media/explore-data-service/add-new-filter-trip-purpose-1.png" alt-text="Screenshot showing adding a new filter for trip purpose." lightbox="media/explore-data-service/add-new-filter-trip-purpose-1.png":::

In this exploration experience, the filters are added as pills at the top of view, so you can easily see what the current filter state is and quickly modify it on the fly.  

:::image type="content" source="media/explore-data-service/apply-filter-trip-purpose-honeymoon-2.png" alt-text="Screenshot showing applying the trip purpose filter." lightbox="media/explore-data-service/apply-filter-trip-purpose-honeymoon-2.png":::

## 5. Save and share your exploration 

### Save your exploration

To save and share your exploration, select the **Save** button in the upper-left corner. In the dialog, you can name the exploration, pick a workspace to save it to, and add a sensitivity label, if applicable.  

> [!NOTE]
> You can only save explorations to workspaces in a Premium capacity at this time. 

:::image type="content" source="media/explore-data-service/save-exploration.png" alt-text="Screenshot showing naming the exploration and adding it to a workspace." lightbox="media/explore-data-service/save-exploration.png":::

### Share your exploration

Now you’re ready to share your exploration with others. Select the **Share** button in the upper-right corner. 

Select **People in your organization can view**.

:::image type="content" source="media/explore-data-service/create-send-link.png" alt-text="Screenshot showing selecting People in your organization can view.":::

Choose your audience and their permissions, and select **Apply**. 

:::image type="content" source="media/explore-data-service/select-audience-permissions.png" alt-text="Screenshot showing selecting audience and permissions.":::

Provide email addresses and a message, then select **Send**.

Or select **Copy link** and send it by another means.

:::image type="content" source="media/explore-data-service/copy-link-send.png" alt-text="Screenshot showing selecting copy link to share it another way.":::

Continue to add your recipients' email addresses and share. You should be immediately prompted to share the underlying dataset so the recipients can view the contents of your exploration. If you're not prompted, ensure that you [share the dataset](../connect-data/service-datasets-share.md) with read permissions.

> [!NOTE]
> Usually for reports, sharing the underlying dataset is done behind the scenes.

You may want to save your exploration as a report instead. You can do so by choosing **Save**, then **Save as report**. This saves your exploration as a single page report matching the layout when saved. For example, if you're viewing both the matrix and the visual, you get one page with a matrix on the top half and the visual on the bottom half of the page.  

You can share this new report as with other reports by using the **Share** button.

## Considerations and limitations

### To create

- Exploration authors need build permissions on the dataset to create an exploration and open the Explore dialog.
- When you save, the destination workspace must be in a Premium capacity. 
- Changing a sensitivity label on a dataset doesn't currently propagate down to the exploration that you create for it.
- There is currently a known issue when you attempt to save an exploration from the Datamart SQL editor entry point.
- Explore isn't currently supported for streaming datasets. 
- If you save to **My workspace**, you may need to refresh your page to see the newly saved exploration artifact.

### To share

- Exploration users need a Power BI Pro or PPU license to share.
- When you share, Power BI prompts you to grant build permissions to the underlying dataset so the recipient can view. If you skip this second dialog, the recipient can't see the exploration and has to ask you for permissions.
- Explorations aren't currently shown in lineage view as related to the dataset.

### To open a saved exploration

- Currently, you can't open an exploration on a mobile device in the Power BI mobile app.

### Entry points

Explore isn't currently available from datasets and reports on the Power BI service Home or Create pages.

### Supported visuals 

All native visuals are supported with the exception of these visuals: 

- Matrix
- Q&A
- Smart narratives
- Metrics
- Paginated reports
- Power Apps
- Power Automate

## Related content

- [Personalize visuals in a report](end-user-personalize-visuals.md)
