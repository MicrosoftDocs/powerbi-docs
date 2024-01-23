---
title: Use Model view in Power BI Desktop
description: Learn how to use Model view to see and work with complex semantic models in a visual format in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 11/10/2023
LocalizationGroup: Transform and shape data
---

# Work with Modeling view in Power BI Desktop

With **Model view** in **Power BI Desktop**, you can view and work with complex semantic models that contain many tables.

## Use Model view

To access **Model view**, select the **Model icon** found on the left side of **Power BI Desktop**, as shown in the following image.

:::image type="content" source="media/desktop-modeling-view/modeling-view-02.png" alt-text="Screenshot of the Modeling view icon in Power BI Desktop.":::

## Create separate diagrams

With **Model view**, you can create diagrams of your model that contain only a subset of the tables in your model. This reorganization can help provide a clearer view into the tables you want to work with, and make working with complex semantic models easier. To create a new diagram with only a subset of the tables, select the **+** button next to the **All tables** tab along the bottom of the Power BI Desktop window.

:::image type="content" source="media/desktop-modeling-view/modeling-view-03.png" alt-text="Screenshot of the + sign button in the tabs section that creates a new diagram.":::

You can then drag a table from the **Data pane** onto the diagram surface. Right-click the table, and then select **Add related tables** from the menu that appears.

:::image type="content" source="media/desktop-modeling-view/modeling-view-04.png" alt-text="Screenshot of the Add related tables options after right clicking a table.":::

When you do, tables that are related to the original table are displayed in the new diagram. The following image shows how related tables are displayed after selecting the **Add related tables** menu option.

:::image type="content" source="media/desktop-modeling-view/modeling-view-05.png" alt-text="Screenshot of the related tables add in the new Modeling view tab.":::

>[!NOTE]
>You can also find the **Add related tables** option in the context menu on the background of the model view. When selected, any table that has any relationship to any table already included in the layout will be added to the layout.


## Use Model explorer (preview)

To access Model explorer, make sure you're in **Model view** by selecting the **Model** icon found on the left side of **Power BI Desktop**. Then in the **Data pane**, select **Model** as shown in the following image.

:::image type="content" source="media/desktop-modeling-view/modeling-view-07.png" alt-text="Screenshot of Model view." lightbox="media/desktop-modeling-view/modeling-view-07.png":::

The **Model explorer** shows a tree view of the semantic model or data model with the number of items in each node displayed. Learn more about [Model explorer](model-explorer.md).


## Set common properties

You can select multiple objects at once in **Model view** by holding down the **Ctrl** key and selecting multiple tables. When you select multiple tables, they become highlighted in Modeling view. When multiple tables are highlighted, changes applied in the **Properties** pane apply to all selected tables.

For example, you could change the [visibility](desktop-storage-mode.md) for multiple tables in your diagram view by holding down the **Ctrl** key, selecting tables, then changing the *is hidden* setting in the **Properties** pane.

:::image type="content" source="media/desktop-modeling-view/modeling-view-06.png" alt-text="Screenshot highlighting changing the Storage mode on multiple tables." lightbox="media/desktop-modeling-view/modeling-view-06.png":::

## Related content

The following articles describe more about data models, and also describe DirectQuery in detail.

* [Automatic aggregations](../enterprise/aggregations-auto.md)
* [Use composite models in Power BI Desktop](desktop-composite-models.md)
* [Manage storage mode in Power BI Desktop](desktop-storage-mode.md)
* [Many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md)

DirectQuery articles:

* [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
* [Power BI data sources](../connect-data/power-bi-data-sources.md)
